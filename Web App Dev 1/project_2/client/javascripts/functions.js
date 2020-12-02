// jshint esversion: 7

// Req 3a

revWords1 = (str) => {
  arr = str.split(" ");
  length = arr.length;
  newStr = "";

  for (var i = 0; i < length ; i++) {
    letter = arr[i].split("");
    revWord = letter.reverse();
    newWord = revWord.join("");
    newStr = newStr + " " + newWord;
  }
  return newStr;
};

// Req 3b

revWords2 = (str) => {
  arr = str.split(" ");
  newStr = "";

  arr.forEach((word) => {
    letter = word.split("");
    revWord = letter.reverse();
    newWord = revWord.join("");
    newStr = newStr + " " + newWord;
  });
  return newStr;
};

// Req 3c

revWords3 = (str) => {
  arr = str.split(" ");
  newStr = "";

  for (var word of arr) {
    letter = word.split("");
    revWord = letter.reverse();
    newWord = revWord.join("");
    newStr = newStr + " " + newWord;
  }
  return newStr;
};

// Req 5 XC

let containsDuplicates = (str) => {
  arr = str.split(" ");

  for (var index in arr) {
    word = arr[index].toUpperCase();
    length = word.length;

    for (var i = 0; i < length ; i++) {
      letter = word[i];
      code = letter.charCodeAt();
      position = code - 64;
      item = 0;

      item = 

      }

    if (item == position) {
      return true;
    }

    else {
      return false;
    }
  }
}
};
