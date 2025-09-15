function test() {
    // RemoveIndex = localStorage[PizzaOrderNr]
    console.log(localStorage)
    let result;
    for (let index = 0; index < localStorage.length - 1; index++) {
        text = localStorage.getItem[index]
        result = text.split(",");
    }


    console.log(result)
    console.log(text)


    document.getElementById(kund_text).children[0].innerHTML = result[0]
    document.getElementById(kund_text).children[1].innerHTML = result[4] + result[5] + result[6]




}
const kundvagn_holder = document.getElementsByClassName("kundvagn_holder")

function removepizza() {
    // localStorage.removeItem(RemoveIndex)

}

//ha med ta bort knapp och lägg till p taggar och göm localstorage i en input hidden