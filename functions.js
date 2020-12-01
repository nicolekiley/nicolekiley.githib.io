// jshint esversion: 6

arrAvg = (arr) => {
  var total_sum = 0, n = arr.length;
  for (i = 0; i < n; i++) {
    total_sum += arr[i];
  }

  return total_sum/n;
};

arrMax = (arr) => {
  largest_num = 0;
  arr.forEach((elem) => {
    if (largest_num < elem) {
      largest_num = elem;
    }
  });
  return largest_num;
};

sumEvens = (arr) => {
  sum = 0;
  for (let num of arr) {
    if (num % 2 == 0) {
      sum += num;
    }
  }
  return sum;
};

var alphaPosition = function(ch) {
  let letter = ch.toUpperCase();
  let code = letter.charCodeAt();
  position = code - 64;
  return position;
};
