const template = document.querySelector(".cart_pizza");
const container = document.querySelector(".cart_container");

for (let index = 0; index < localStorage.length - 1; index++) {
  const value = localStorage.getItem(index);

  const clone = template.cloneNode(true);
  clone.querySelector("h4").textContent = value;
  clone.style.display = "block";
  clone.querySelector("input").value = index;
  container.appendChild(clone);
}

function remove_pizza(button){
    index = button.parentElement.querySelector("input").value;
    localStorage.removeItem(index)
    button.parentElement.remove;
}

function add_pizzas() {
    // RemoveIndex = localStorage[PizzaOrderNr]
    let result = [];

    for (let i = 0; i < localStorage.length; i++) {
        let text = localStorage.getItem(localStorage.key(i));

  // split into lines
        let parts = text.split("\n");

  // process each part
        let formatted = parts.map(line => {
    // if the line contains only digits (or commas after split), group with commas
            let items = line.split(/\s+/).filter(Boolean); // split by whitespace
            if (items.every(v => /^\d+$/.test(v))) {
                return items.join(","); // join numbers with commas
            }
            return line; // keep strings as-is
        });

    result.push(...formatted); // flatten into result
    }
    let finalString = result.join("\n");
    console.log(finalString);
    document.getElementById("hidden-input").value = finalString
    // console.log(document.getElementById("hidden-input").value = result);
}

function test(){
    console.log(localStorage)
}

function test2(){
    localStorage.clear()
}
//const kundvagn_holder = document.getElementsByClassName("kundvagn_holder")

function removepizza() {
    // localStorage.clear()

}

//ha med ta bort knapp och lägg till p taggar och göm localstorage i en input hidden