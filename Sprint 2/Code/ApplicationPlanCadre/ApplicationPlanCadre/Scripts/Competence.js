$(document).ready(function () {
    initDropDown("enonce", null);
});

function initDropDown(elementType, index) {
    if (elementType === "enonce") {
        var selectListEnonce = document.getElementById('enonce');
        var optionEnonce = document.createElement("option");
        optionEnonce.text = "Selectionnez un énoncé";
        selectListEnonce.insertBefore(optionEnonce, selectListEnonce.firstChild);
        ResetIndex("enonce", null);
    }
    else {
        var selectListElement = document.getElementById('dropDownListElement' + index);
        var optionElement = document.createElement("option");
        optionElement.text = "Selectionnez un élément";
        selectListElement.insertBefore(optionElement, selectListElement.firstChild);
        ResetIndex("element", index);
    }
}

function selectedEnonce() {
    var selectList = document.getElementById('enonce');
    var enonce = selectList.options[selectList.selectedIndex];
    document.getElementById("enonceBox").innerHTML += buildChildHtml("enonce", null, enonce.text, enonce.index, null);
    populateDdl(enonce.index);
    initDropDown("element", enonce.index);
    optionEnabled("enonce", null, selectList.selectedIndex, false);
    ResetIndex("enonce", null);
}

function selectedElement(index) {
    var selectList = document.getElementById('dropDownListElement' + index);
    var element = selectList.options[selectList.selectedIndex];
    var value = selectList.options[selectList.selectedIndex].value;
    document.getElementById("elementBox" + index).innerHTML += buildChildHtml("element", index, element.text, element.index, value);
    optionEnabled("element", index, selectList.selectedIndex, false);
    ResetIndex("element", index);
}

function buildChildHtml(elementType, ddlindex, nom, index, value) {
    if (elementType === "enonce") {
        id = "enonce" + index;
        return html =
            "<div id='" + id + "'class='child-field clearfix'>" +
            "<input type='number' name='ponderationEnHeure' class='form-control' id='durationEnonce" + index + "' min='0' maxlength='3' onkeydown = 'return (!(event.keyCode >= 65) && event.keyCode != 32);'>" +
            "<p>" + nom + "</p>" +
            "<span  onclick='removeEnonce(&#39enonce&#39, " + index + ", null)' class='glyphicon glyphicon-remove'></span>" +
            "<input type='hidden' name='enonces' value='" + index + "' />" +
            "<select class='form-control' id='dropDownListElement" + index + "' onchange='selectedElement(" + index + ")'></select> " +
            "<div id='elementBox" + index + "'></div>" +
            "</div>";
    }
    else {
        id = "element" + index;
        return html = 
            "<div id='" + id + "'class='child-field clearfix'>" +
            "<p>" + nom + "</p>" +
            "<span  onclick='removeEnonce(&#39element&#39, " + index + "," + ddlindex + ")' class='glyphicon glyphicon-remove'></span>" +
            "<input type='hidden' name='elements' value='" + value + "' />" +
            "</div>";
    }
}

function populateDdl(index) {
    var filledList = document.getElementById("ddlElement" + index);
    var emptyList = document.getElementById("dropDownListElement" + index)
    emptyList.innerHTML = filledList.innerHTML;
}

function removeEnonce(elementType, index, ddlindex) {
    if (elementType === "enonce") {
        var EnonceNode = document.getElementById("enonce" + index);
        optionEnabled("enonce", null, index, true);
        EnonceNode.remove();
    }
    else {
        var elementNode = document.getElementById("element" + index);
        optionEnabled("element", ddlindex, index, true);
        elementNode.remove();
    }
}

function ResetIndex(elementType, index) {
    if (elementType === "enonce") {
        document.getElementById('enonce').selectedIndex = "0";
    }
    else {
        document.getElementById("dropDownListElement" + index).selectedIndex = "0";
    }
}
    

function optionEnabled(elementType, id, index, state) {
    if (elementType === "enonce") {
        document.getElementById("enonce").options[index].disabled = !state;
    }
    else {
        document.getElementById("dropDownListElement" + id).options[index].disabled = !state
    }
}