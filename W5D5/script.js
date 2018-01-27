// script.js
"use strict";

// function soundMaker(sound, times) {

//   // Closure - a function that uses a variable that was defined outside of it but not at the time the function itself was defined
//   function makeSound() {
//     console.log(`${sound}`);
//   }

//   for(let i = 0; i < times; i++) {
//     makeSound();
//   }
// }

// soundMaker("woof", 5);


let callback = function() {
  console.log("It has been 5 seconds!");
}

let timeToWait = 5000; // ms


// global.setTimeout(callback, timeToWait);


// more likely to see:
// global.setTimeout(function() {
//   console.log("It has been five seconds!");
// }, 5000);
// ^^ this is ES5 syntax fyi


// ES6:
global.setTimeout(() => {
  console.log("It has been 5 seconds!")
}, 5000);
// ^^ preferred syntax

