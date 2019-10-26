
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  let pTag = document.createElement("p");
  pTag.innerHTML = string;
  if (Array.from(htmlElement.children).length > 0){
    htmlElement.removeChild(htmlElement.firstChild);
  }
  htmlElement.appendChild(pTag);
};

// htmlGenerator('I <3 Vanilla DOM manipulation.', partyHeader);
