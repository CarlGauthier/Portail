$(document).ready(function () {
    initDropDown();
    hiddenddl();
});
function hiddenddl() {
    var filledList = document.getElementById("planCadreElement");
    var emptyList = document.getElementById("hiddenddl")
    emptyList.innerHTML = filledList.innerHTML;
}

function initDropDown()
{
    var selectListeElement = document.getElementById('planCadreElement');
    var optionElement = document.createElement("option");
    optionElement.text = "Selectionnez un énoncé";
    selectListeElement.insertBefore(optionElement, selectListeElement.firstChild);
    ResetIndex();
}

function ResetIndex() {
    document.getElementById('planCadreElement').selectedIndex = "0";
}

function selectedElement() {
    var selectList = document.getElementById('planCadreElement');
    var element = selectList.options[selectList.selectedIndex];
    document.getElementById("elementBox").innerHTML += buildChildHtml(element.text, element.index);
    optionEnabled(selectList.selectedIndex, false);
    ResetIndex();
}

function buildChildHtml(nom, index) {
    id = "element" + index;
    return html =
        "<div id='" + id + "'class='child-field clearfix'>" +
        "<p>" + nom + "</p>" +
        "<span  onclick='removeEnonce(&#39element&#39, " + index + ")' class='glyphicon glyphicon-remove'></span>" +
        "<input type='hidden' name='enonces' value='" + index + "' />" +
        "</div>";
}

function optionEnabled(index, state) {
    document.getElementById("planCadreElement").options[index].disabled = !state;
}

function ajouterConnaissance() {
    var newElement = document.getElementById("newConnaissance");
    newElement.innerHTML +=
        "<div>" +
        "<p>Ajouter des éléments de competence a l'élément de connaissance</p>" + 
        "<input type'text' name'elementConnaissance'/>" + 
        "<div id='elementBox" +  + "'></div>" +
        "</div>";
}