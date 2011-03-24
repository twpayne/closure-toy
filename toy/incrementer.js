goog.provide('toy.Incrementer');

goog.require('goog.array');



/**
 * @constructor
 * @param {number} increment The value by which to increment by.
 */
toy.Incrementer = function(increment) {
  /**
   * @type {number} The value to add.
   * @private
   */
  this.increment_ = increment;
};


/**
 * @const
 * @type {number}
 */
toy.Incrementer.ONE = 1;


/**
 * @return {number} The increment.
 */
toy.Incrementer.prototype.getIncrement = function() {
  return this.increment_;
};


/**
 * @param {number} x The value to increment.
 * @return {number} {@code x}, incremented.
 */
toy.Incrementer.prototype.increment = function(x) {
  return x + this.increment_;
};


/**
 * @param {Array.<number>} xs The values to increment.
 * @return {Array.<number>} The {@code xs}, incremented.
 */
toy.Incrementer.prototype.incrementEach = function(xs) {
  return goog.array.map(xs, function(x) {
    return x + this.increment_;
  }, this);
};
