const agifyApiUrl = "https://api.agify.io/"

const displayDefinition = (event) => {
  event.preventDefault();
  const word = document.getElementById("word").value;
  // TODO: Display your age with an AJAX call instead of the console.log()
  console.log(word);
}

const form = document.getElementById("fetch-word");
form.addEventListener("submit", displayDefinition);
