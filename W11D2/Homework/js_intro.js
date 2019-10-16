function titleize(names, cb) {
  let titleized = names.map(name => name[0].toUpperCase() + name.slice(1, name.length));
  titleized.forEach( 
    (name) => {console.log(cb(name))}
  );
};

function callback(name) {
  return "Mx. " + name + " Jingleheimer Schmidt"
};

////////////////////////////////////////////////////////////////////////////////

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
  
};

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

Elephant.prototype.trumpet = function () {
  return this.name + " the elephant goes 'phrRRRRRRRRRRR!!!!!!!'";
};

Elephant.prototype.grow = function () {
  this.height += 12;
  return this.height;
};

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
  return this.tricks;
};

Elephant.prototype.play = function () {
  return this.tricks[Math.floor(Math.random() * ((this.tricks.length - 1) - 0 + 1) + 0)];
};

// herd.forEach(
//   (elephant) => { Ellephant.paradeHelper(elephant.name) }
// );
function stampede(elephants, cb) {
  elephants.forEach(
    (animal) => { cb(animal.name) }
  );
};

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

// Elephant.paradeHelper(micah);

//////////////////////////////////////////////////////////////////////////////////////////////////////////

dinerBreakfast = function (order = 'scrambled eggs and bacon') {
  
  console.log(`I'd like ${order} please.`);
};