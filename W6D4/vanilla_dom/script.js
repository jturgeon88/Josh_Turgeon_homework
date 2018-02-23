document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  // FIRST: Need to find the input
  //SECOND: Add an event listener for the submit button
    //on that event, we'll set a const equal to the input we found
    // then clear the currenTarget
    //then create an li, add the const as the text
    //finally we'll append it to the ul
  const favForm = document.getElementById('favorite-form');
  favForm.addEventListener('submit', (event) => {
    event.preventDefault();

    const favInputEl = document.querySelector('.favorite-input');
    const favPlace = favInputEl.value;
    favInputEl.value = "";

    //get ul of places
    const placesUl = document.getElementById('sf-places');
    //create li
    const li = document.createElement('li');
    li.textContent = favPlace;

    //insert new li into ul
    placesUl.appendChild(li);
  });


  // adding new photos

  // --- your code here!
  // TOGGLING THE FORM:
  const showPhotoForm = (e) => {
    const photoFormDiv = document.querySelector(".photo-form-container");
    if (photoFormDiv.className === "photo-form-container") {
      photoFormDiv.className = "photo-form-container hidden";
    } else {
      photoFormDiv.className = "photo-form-container";
    }
  };

  //add event listener that calls our showPhotoForm callback
  const photoFormShowButton = document.querySelector('.photo-show-button');
  photoFormShowButton.addEventListener('click', showPhotoForm);

  //Append the photo from url provided
  const handlePhotoSubmit = (e) => {
    e.preventDefault();

    const photoUrlInput = document.querySelector(".photo-url-input");
    const photoUrl = photoUrlInput.value;
    photoUrlInput.value = "";

    //get ul of photos
    const dogsUl = document.querySelector(".dog-photos");
    //create li
    const photoLi = document.createElement('li');
    //create img
    const dogImg = document.createElement('img');
    // fill the img
    dogImg.src = photoUrl;
    //append the img to the li and the li to the ul
    photoLi.appendChild(dogImg);
    dogsUl.appendChild(photoLi);
  };

  //tie the submit button to the event handler callback
  const photoSubmitButton = document.querySelector(".photo-url-submit");
  photoSubmitButton.addEventListener('click', handlePhotoSubmit);
});
