

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  let first, second;

  reader.question("Would you like some tea?", function(answer){
    first = answer;
    console.log(`You said ${answer}`);

    reader.question("Would you like some biscuits?", function(answer) {
      second = answer;
      console.log(`You said ${answer}`);

      let firstAns = (first === 'yes') ? 'do' : 'don\'t';
      let secondAns = (second === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${firstAns} want tea and you ${secondAns} want biscuits.`);
      reader.close();
    });
  });
}

// function teaAndBiscuits () {
//   let first, second;

//   reader.question('Would you like some tea?', (res) => {
//     first = res;
//     console.log(`You replied ${res}.`);

//     reader.question('Would you like some biscuits?', (res) => {
//       second = res;
//       console.log(`You replied ${res}.`);
    
//       const firstRes = (first === 'yes') ? 'do' : 'don\'t';
//       const secondRes = (second === 'yes') ? 'do' : 'don\'t';
//       console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
//       reader.close();
//     });
//   });


// }

teaAndBiscuits();
