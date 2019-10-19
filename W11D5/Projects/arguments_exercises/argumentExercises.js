function sum() {
  let count = 0;
  let nums = Array.from(arguments);
  for (let i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  return count;
}

function sum2(...args) {
  let count = 0;
  for (let i = 0; i < args.length; i++) {
    count += args[i];
  }
  return count;
}

Function.prototype.myBind = function (context) {
  let that = this;
  let bindArguments = Array.from(arguments).slice(1);
  return function () {
    let callArguments = Array.from(arguments);
    return that.apply(context, bindArguments.concat(callArguments));
  }
}

Function.prototype.myBind2 = function (context, ...bindArguments) {
  return (...callArguments) => this.apply(context, bindArguments.concat(callArguments));
}

function curriedSum(numArgs) {
  let numbers = [];
  function _curriedSum(number) {
    numbers.push(number);
    if (numbers.length === numArgs) {
      let count = 0;
      for (let i = 0; i < numbers.length; i++) {
        count += numbers[i];
      }
      return count;
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

Function.prototype.curry = function (numArgs) {
  let args = [];
  let that = this;
  function _curry(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return that(...args);
    } else {
      return _curry;
    }
  }
  return _curry;
}

Function.prototype.curry2 = function (numArgs) {
  let args = [];
  let that = this;
  function _curry(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return that.apply(null, args);
    } else {
      return _curry;
    }
  }
  return _curry;
}
