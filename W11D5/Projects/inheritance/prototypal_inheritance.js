Function.prototype.inherits = function (SuperClass) {
  function Surrogate () {};
  Surrogate.prototype = SuperClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}

Function.prototype.inherits2 = function (SuperClass) {
  this.prototype = Object.create(SuperClass.prototype);
  this.prototype.constructor = this;
}



function MovingObject (name) {
  this.name = name;
}

MovingObject.prototype.destroyed = function () {
  console.log(this.name + " is destroyed!");
}

function Ship (name) {
  MovingObject.call(this, name);
}

Ship.inherits(MovingObject);

function Asteroid (name) {
  MovingObject.call(this, name);
}

Asteroid.inherits(MovingObject);

Ship.prototype.shoot = function () {
  console.log(this.name + " shoots!");
}

Asteroid.prototype.hit = function () {
  console.log(this.name + " was hit!");
}

let spaceship = new Ship("Spaceship");
let asteroid = new Asteroid("Roid1");
spaceship.shoot();
asteroid.hit();
spaceship.destroyed();
asteroid.destroyed();