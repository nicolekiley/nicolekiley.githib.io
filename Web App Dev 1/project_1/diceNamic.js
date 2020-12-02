//jshint esversion: 7

  //define helper functions here

  let rollDie = () => {
    return Math.floor(Math.random() * 6) + 1;
  };

  //Define a controller to handle the button click
  let controller = () => {
    let target, die1, die2, rollCount = 0,
      die1URL, die2URL, imgElem1, imgElem2, cheeryMs;

      target = document.querySelector("input").value;
      console.log(target);


  do {
    //roll the dice
    die1 = rollDie();
    die2 = rollDie();
    //increment the roll counter

    rollCount += 1;

    //log the dice and the counter
    console.log(`${die1} ${die2} ${rollCount}`);

  } while (die1 + die2 != target);

  // Update images on web page
  die1URL = `images/die${die1}.gif`;
  imgElem1 = document.querySelector("#imgElem1");
  imgElem1.setAttribute("src", die1URL);

  die2URL = `images/die${die2}.gif`;
  imgElem2 = document.querySelectorAll("img")[1];
  imgElem2.setAttribute("src", die2URL);

  //display number of rolls on webpage
  cheeryMsg = `You hit your number in ${rollCount} roll${(rollCount == 1)?"":"s"}! `;
  document.querySelector("div").innerHTML = cheeryMsg;

};

document.querySelector("body");

//Register the controller after the DOM is complete
window.addEventListener("load", () => {
  //select the button
  let button = document.querySelector("button");

  //register the click handler for the button
  button.addEventListener("click", controller);
});
