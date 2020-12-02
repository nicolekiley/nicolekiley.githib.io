//jshint esversion: 7

//fill an array with the numbers from start to stop, in steps of step
let fillArray = (start, stop, step) => Array.from({ length: (stop - start) / step + 1}, (_, i) => start + (i * step));

//create an array of the numbers 1 - 100
let arrOf1To100 = fillArray(1, 100, 1);

//log the array for inspection
console.log(arrOf1To100);

let bitBatBotOrNot = (n) => {

  let result = "";
  if (n % 3 == 0) {
    result = `${result}Bit`;
  }
  if (n % 5 == 0) {
    result = `${result}Bat`;
  }
  if (n % 7 == 0) {
    result = `${result}Bot`;
  }
  if (n % 3 != 0 && n % 7 != 0 && n % 5 != 0){
    result = 'not';
  }

  return result;
};

let findAllbitBatBotOrNots1 = (arr) => {
  let newArr = [];
  arr.map(elem => {
    newElem = `${elem} : ${bitBatBotOrNot(elem)}`;
    newArr.push(newElem);
  });
  return newArr;
};

let findAllbitBatBotOrNots2 = (arr) => {
   let newArr = [];
   for (var i = 0; i < arr.length; i++) {
    newArr.push(`${arr[i]} : ${bitBatBotOrNot(arr[i])}`);
  }
  return newArr;
};

let findAllbitBatBotOrNots3 = (arr) => {
   let newArr = [];
   for (var item of arr) {
     newArr.push(`${item} : ${bitBatBotOrNot(item)}`);
   }
   return newArr;
};

let findAllbitBatBotOrNots4 = (arr) => {
  newArr = [];
  arr.forEach((elem) => {
    newArr.push(`${elem} : ${bitBatBotOrNot(elem)}`);
  });
  return newArr;
};

findAllbitBatBotOrNots1(arrOf1To100);

findAllbitBatBotOrNots2(arrOf1To100);

findAllbitBatBotOrNots3(arrOf1To100);

findAllbitBatBotOrNots4(arrOf1To100);

let findAllbitBatBotOrNotsXC = (arr) => {
  newArr = [];
  for (var index in arr) {
    newArr.push(`${arr[index]} : ${bitBatBotOrNot(arr[index])}`);
  }
  return newArr;
};
