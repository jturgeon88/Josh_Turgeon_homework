function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
}


function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}


function fizzBuzz(array) {
  let odd_array = []
  for (let i = 0; i < array.length; i++) {
    if ((array[i] % 3 === 0) ^ (array[i] % 5 === 0)) {
      odd_array.push(array[i]);
    } 
  }
  return odd_array;
}


function isPrime(number) {
  if (number < 2) { return false }

  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    } 
  }

  return true;
}


function sumOfNPrimes(n) {
  let counter = 0;
  let sum = 0;
  let i = 2;

  while (counter < n) {
    if (isPrime(i)) {
      sum += i;
      counter++;
    }
    i++;
  }

  return sum;
}