

function pizza_check(button, modal) {
    const modal_body = modal.querySelector(".modal-body")
    switch(button.id) {
        case "Margherita":
                document.getElementById("inlineCheckbox1").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox2").parentElement.children[0].checked = true;
                document.getElementById("inlineCheckbox3").parentElement.children[0].checked = true;
                //ta fram modal inline-input genom children från button id och fore-check:a dom när man klickar på knappen
            break;
        case "Capricciosa":
                //ta fram modal inline-input genom children från button id och fore-check:a dom när man klickar på knappen
            break;
        case "Marinara":
                //ta fram modal inline-input genom children från button id och fore-check:a dom när man klickar på knappen
            break;
        case "QUattro formaggi":
                //ta fram modal inline-input genom children från button id och fore-check:a dom när man klickar på knappen
            break;
        case "Prosciutto e funghi":
                //ta fram modal inline-input genom children från button id och fore-check:a dom när man klickar på knappen
            break;
        case "Ortolana":
                //ta fram modal inline-input genom children från button id och fore-check:a dom när man klickar på knappen
            break;
        case "Quattro stagioni":
                //ta fram modal inline-input genom children från button id och fore-check:a dom när man klickar på knappen
            break;
        case "Diavola":
                //ta fram modal inline-input genom children från button id och fore-check:a dom när man klickar på knappen
            break;
    }
    modal.querySelector(".modal-header").querySelector(".modal-title").innerHTML = button.id
    
}