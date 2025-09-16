

function pizza_check(button) {
    for (let index = 1; index <= 15; index++) {document.getElementById("inlineCheckbox" + index).parentElement.children[0].checked = false;}

    const modal_body = document.querySelector(".modal-body")
    
    switch(button.id) {
        case "Margherita":
                document.getElementById("inlineCheckbox1").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox2").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox3").parentElement.children[0].checked = true;
                
            break;
        case "Capricciosa":
                document.getElementById("inlineCheckbox1").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox2").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox4").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox5").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox6").parentElement.children[0].checked = true;
                
            break;
        case "Marinara":
                document.getElementById("inlineCheckbox1").parentElement.children[0].checked = true;
                
            break;
        case "Quattro formaggi":
                document.getElementById("inlineCheckbox1").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox2").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox7").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox8").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox9").parentElement.children[0].checked = true;
                
            break;
        case "Prosciutto e funghi":
                document.getElementById("inlineCheckbox1").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox2").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox4").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox5").parentElement.children[0].checked = true;
                
            break;
        case "Ortolana":
                document.getElementById("inlineCheckbox1").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox2").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox10").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox11").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox12").parentElement.children[0].checked = true;
                
            break;
        case "Quattro stagioni":
                document.getElementById("inlineCheckbox1").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox2").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox4").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox5").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox6").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox13").parentElement.children[0].checked = true;
                
            break;
        case "Diavola":
            document.getElementById("inlineCheckbox1").parentElement.children[0].checked = true;
            document.getElementById("inlineCheckbox2").parentElement.children[0].checked = true;
            document.getElementById("inlineCheckbox14").parentElement.children[0].checked = true;
            document.getElementById("inlineCheckbox10").parentElement.children[0].checked = true;
            document.getElementById("inlineCheckbox15").parentElement.children[0].checked = true;

            break;
    }
    document.querySelector(".modal-header").querySelector(".modal-title").innerHTML = button.id;
}

function cart_add(modal) {
    title = modal.querySelector(".modal-header").querySelector(".modal-title").innerHTML;
    
    ingredients = [];
    for (let index = 1; index <= 15; index++) {
        if (document.getElementById("inlineCheckbox" + index).parentElement.children[0].checked) {
            ingredient = document.getElementById("inlineCheckbox" + index).parentElement.children[0].value;
            ingredients.push(parseInt(ingredient));
        }
    }

    for (let index = 1; index <= 2; index++) {
        if (document.getElementById("exampleRadios" + index).checked) {
            size = document.getElementById("exampleRadios" + index).parentElement.children[1].innerHTML;
        }
    }

    gluten = document.getElementById("glute_check").checked
    
    pizza = [title, gluten, size, ingredients]
    
    let index = 0;
    for (index = 0; window.localStorage.getItem(index) != null; ++index) {}
    window.localStorage.setItem(index,pizza);

    console.log(localStorage)
}

function buy(button){
    modal = document.getElementById("pizza_modal")
    pizza_check(button)
    cart_add(modal)
}