goog.provide('toy.main');

goog.require('goog.string.format');
goog.require('toy.Incrementer');


/**
 * @define {boolean} Whether to use goog.string.format.
 */
toy.USE_STRING_FORMAT = true;


/**
 * The main function.
 */
toy.main = function() {
  var incrementer = new toy.Incrementer(toy.Incrementer.ONE);
  var x = 1;
  var xIncremented = incrementer.increment(x);
  var message;
  if (toy.USE_STRING_FORMAT) {
    message = goog.string.format('x incremented = %d', xIncremented);
  } else {
    message = 'x incremented = ' + xIncremented;
  }
  alert(message);
};
goog.exportSymbol('toy.main', toy.main);
