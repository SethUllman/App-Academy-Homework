
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

export function dogLinkCreator() {
  let dogLinks = [];
  for (const key in dogs) {
    let dog = document.createElement("a");
    dog.innerHTML = key;
    dog.setAttribute("href", dogs[key]);
    let li = document.createElement("li");
    li.className = "dog-link";
    li.appendChild(dog);
    dogLinks.push(li);
  }
  return dogLinks;
}

export function attachDogLinks() {
  let ul = document.getElementsByClassName("drop-down-dog-list");
  dogLinkCreator().forEach(li => {
    Array.from(ul)[0].appendChild(li);
  });
}

export function toggleOn() {
  let ul = document.getElementsByClassName("drop-down-dog-list");
  let button = document.getElementsByClassName("drop-down-dog-nav");
  Array.from(button)[0].addEventListener("mouseover", () => {
    Array.from(ul)[0].classList = ("drop-down-dog-list-show");
  });
  toggleOff();
}
export function toggleOff() {
  let ul = document.getElementsByClassName("drop-down-dog-list-show");
  let button = document.getElementsByClassName("drop-down-dog-nav");
  // debugger;
  Array.from(button)[0].addEventListener("mouseout", () => {
    Array.from(ul)[0].classList = ("drop-down-dog-list");
  });
}


attachDogLinks();

toggleOn();
