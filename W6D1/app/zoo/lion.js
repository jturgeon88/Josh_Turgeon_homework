const Animal = require('./animal.js');

//Inherit Lion from Animal
class Lion extends Animal {
  roar() {
    console.log("ROR?");
  }
};

module.exports = Lion;