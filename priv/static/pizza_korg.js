function test() {
    console.log(localStorage)
}
const kundvagn_holder = document.getElementsByClassName("kundvagn_holder")

for (let index = 0; index < localStorage.length; index++) {
    const clone = kundvagn_holder.cloneNode(true)
    document.appendChild(clone)
}
//ha med ta bort knapp och lägg till p taggar och göm localstorage i en input hidden