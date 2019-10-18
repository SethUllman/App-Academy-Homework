class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    this.date = new Date();
    setInterval(() => { this._tick(); }, 1000); 
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(this.time);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.date.setSeconds(this.date.getSeconds() + 1); 
    this.time = this.date.getHours() + ":" + this.date.getMinutes() + ":" + this.date.getSeconds();
    this.printTime(); 
  };
}

// const clock = new Clock();

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const addNumbers = (sum, numsLeft, completionCallback) => {
  if (numsLeft > 0) {
    reader.question("Input a number: ", function(numString) {
      const number = parseInt(numString);
      sum += number;
      console.log("Partial Sum: " + sum);
      addNumbers(sum, numsLeft-1, completionCallback);
    });
  } else {
    completionCallback(sum);
    reader.close(); 
  }
}; 

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

function askIfGreaterThan(el1, el2, callback) {
  reader.question("Is " + el1 + " greater than " + el2 + " ? Type 'yes' or 'no' : ", (answer) => {
    const response = answer;
    if (response === 'yes') {
      callback(true); 
    } else {
      callback(false); 
    } 
  }); 
}


// askIfGreaterThan(1, 4, (trueOrFalse) => { console.log(trueOrFalse) }); 

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i == (arr.length - 1)) {
    outerBubbleSortLoop(madeAnySwaps); 
    return; 
  };

  askIfGreaterThan(arr[i], arr[i+1], (isGreaterThan) => {
    if (isGreaterThan) {
      let greater = arr[i];
      arr[i] = arr[i+1];
      arr[i+1] = greater;
      madeAnySwaps = true;
    }

    innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
  });
}


// innerBubbleSortLoop([4,2,7,2], 0, false, outerBubblesortLoop);

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop); 
    } else {
      sortCompletionCallback(arr);
    }
  }; 

  outerBubbleSortLoop(true); 
}

// absurdBubbleSort([3, 2, 1], function (arr) {
//   console.log("Sorted array: " + JSON.stringify(arr));
//   reader.close();
// });

Function.prototype.myBind = function (context) {
  return () => {this.apply(context)}; 
};

// class Lamp {
//   constructor() {
//     this.name = "a lamp";
//   }
// }

// const turnOn = function () {
//   console.log("Turning on " + this.name);
// };

// const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

// const boundTurnOn = turnOn.bind(lamp);
// const myBoundTurnOn = turnOn.myBind(lamp);

// boundTurnOn(); // should say "Turning on a lamp"
// myBoundTurnOn(); // should say "Turning on a lamp"

Function.prototype.myThrottle = function(interval) {
  let tooSoon = false;
  return (...args) => {
    if (!tooSoon) {
      tooSoon = true;
      setTimeout( () => { tooSoon = false; }, interval); 
      this(...args); 
    }
  }
}



// class Neuron {
//   constructor() {
//     this.fire = this.fire.myThrottle(500);
//   }

//   fire() {
//     console.log("Firing!");
//   }
// }

// const neuron = new Neuron();

// const interval = setInterval(() => {
//   neuron.fire();
// }, 10);

class SearchBar {
  constructor() {
    this.query = "";

    this.type = this.type.bind(this);
    this.search = this.search.bind(this);
  }

  type(letter) {
    this.query += letter;
    this.search();
  }

  search() {
    console.log(`searching for ${this.query}`);
  }
}

const searchBar = new SearchBar();

const queryForHelloWorld = () => {
  searchBar.type("h");
  searchBar.type("e");
  searchBar.type("l");
  searchBar.type("l");
  searchBar.type("o");
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
};



Function.prototype.myDebounce = function(interval) {
  let timeout; 
  
  return (...args) => {
    const func = () => {
      timeout = null; 
      this(...args); 
    }

    clearTimeout(timeout);
    timeout = setTimeout(func, interval);
  }
}; 

searchBar.search = searchBar.search.myDebounce(500);

queryForHelloWorld();