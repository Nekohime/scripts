#!/usr/bin/env node

const apology = ['Sorry, ', 'Uh oh, ', ''];
const x = [
  'my Dog', 'my Cat', 'my Fox', 'my Bitcoins', 'my Mom', 'my Dad',
  'my Computer', 'my Slave', 'my Sister', 'my Brother', 'my Grandma',
  'my Grandpa', 'my Best Friend', 'my Girlfriend', 'my Boyfriend',
  'my Partner', 'my MIL', 'my Cousin', 'my Dumbass friend', 'my Senpai', 'I',
];
const y = [
  'died', 'vomitted', 'threw up everywhere', 'crashed', 'ate my Chocolate Cake',
  'destroyed my Switch', 'broke my door', 'broke my wrist', 'stole my money',
  'ate my money', 'called me Shirley', 'stole my Phone', 'burnt down the House',
  'disappeared', 'got drunk', 'passed out', 'stole my pickles',
  'punched a hole in the wall', 'noticed me', 'got Isekai\'d',
  'fell down the stairs', 'peed everywhere', 'stole my Panties',
];
const excuses = [];
function main(numOfExcuses) {

  for (let i = 1; i <= numOfExcuses; i++) {
    const pickApology = getRandomElement(apology);
    const pickX = getRandomElement(x);
    const pickY = getRandomElement(y);
    excuses.push(pickApology + pickX + ' just ' + pickY);
  }
  removeDupes(excuses);

  printExcuses();
}

function getRandomElement(arr) {
  return arr[Math.floor(Math.random() * arr.length)];
}

function capitalizeFirstLetter(str) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

function removeDupes(arr) {
  return Array.from(new Set(arr));
}

function printExcuses() {
  for (const excuse of excuses) {
    console.log(capitalizeFirstLetter(excuse));
  }
}

main(10);
