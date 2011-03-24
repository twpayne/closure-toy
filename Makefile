#COMPILATION_LEVEL=WHITESPACE_ONLY
#COMPILATION_LEVEL=SIMPLE_OPTIMIZATIONS
COMPILATION_LEVEL=ADVANCED_OPTIMIZATIONS

USE_STRING_FORMAT=true
#USE_STRING_FORMAT=false

TARGETS=deps.js compiled.js
SOURCES=$(filter-out $(TARGETS),$(shell find toy -name \*.js))

.PHONY: all
all: $(TARGETS)

deps.js: $(SOURCES) closure-library Makefile
	closure-library/closure/bin/build/depswriter.py \
		--root_with_prefix="closure-library/closure/ ../" \
		--root_with_prefix="toy/ ../../../toy/" \
		--output_file=$@

compiled.js: $(SOURCES) closure-library compiler.jar Makefile
	closure-library/closure/bin/build/closurebuilder.py \
		--compiler_flags=--compilation_level=$(COMPILATION_LEVEL) \
		--compiler_flags=--define=goog.DEBUG=false \
		--compiler_flags=--define=toy.USE_STRING_FORMAT=$(USE_STRING_FORMAT) \
		--compiler_flags=--warning_level=VERBOSE \
		--compiler_jar=compiler.jar \
		--root=closure-library/ \
		--root=toy/ \
		--namespace=toy.main \
		--output_mode=compiled \
		--output_file=$@

closure-library:
	svn checkout http://closure-library.googlecode.com/svn/trunk/ closure-library

compiler.jar:
	curl http://closure-compiler.googlecode.com/files/compiler-latest.tar.gz | tar -xzf - compiler.jar

.PHONY: lint
lint:
	gjslint --strict $(SOURCES)

.PHONY: clean
clean:
	rm $(TARGETS)
