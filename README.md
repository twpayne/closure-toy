Toy project
===========

This trivial project is designed to demonstrate some of the features of
Google's Closure tools.


Quick start
===========

Run `make`.  This will download the Closure library and compiler and build both
compiled and uncompiled versions.  Visit `compiled.html` and `uncompiled.html`
in your web browser to run them.


Play areas
==========

Compilation levels
------------------

Change `COMPILATION_LEVEL` at the top of `Makefile` and rebuild.  Compare the
compiled code in `compiled.js`.


Defines
-------

Change `USE_STRING_FORMAT` at the top of `Makefile` and rebuild.  Compare the
compiled code in `compiled.js`.


Unit tests
----------

Visit `toy/incrementer_tests.html` in your web browser.


Linter
------

Download the Closure linter from <http://code.google.com/closure/utilities/>
and run `make lint`.
