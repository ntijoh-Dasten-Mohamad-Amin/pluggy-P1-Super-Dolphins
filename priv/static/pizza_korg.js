const template = document.querySelector(".cart_pizza");
const container = document.querySelector(".cart_container");

for (let index = 0; index < localStorage.length; index++) {
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
    button.parentElement.remove();
}

function add_pizzas() {
    let result = [];

    for (let i = 0; i < localStorage.length; i++) {
        let text = localStorage.getItem(localStorage.key(i));

        let parts = text.split("\n");

  
        let formatted = parts.map(line => {
    
            let items = line.split(/\s+/).filter(Boolean); 
            if (items.every(v => /^\d+$/.test(v))) {
                return items.join(","); 
            }
            return line; 
        });

    result.push(...formatted); 
    }
    let finalString = result.join("\n");
    console.log(finalString);
    document.getElementById("hidden-input").value = finalString
    localStorage.clear()
}

function remove_all(){
    localStorage.clear()
    location.reload();
}