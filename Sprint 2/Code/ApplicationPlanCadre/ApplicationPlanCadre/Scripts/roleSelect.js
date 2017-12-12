$(document).ready(function () {
    initDropDown();
});

function initDropDown() {
    var selectList = document.getElementById('roles');
    var option = document.createElement("option");
    option.text = "Selectionnez un rôle";
    selectList.insertBefore(option, selectList.firstChild);
    optionEnabled(0, false);
    ResetIndex();
}

function ResetIndex() {
    document.getElementById('roles').selectedIndex = "0";
}

function optionEnabled(index, state) {
    document.getElementById("roles").options[index].disabled = !state;
}

function RCPFormVisible(state) {
    if (state)
        document.getElementById("RCPForm").style.display = "block";
    else
        document.getElementById("RCPForm").style.display = "none";
}

function checkRCP(option, state) {
    if (option.value === "RCP")
        RCPFormVisible(state);
}

function addRole() {
    var selectList = document.getElementById('roles');
    var option = selectList.options[selectList.selectedIndex];
    document.getElementById("rolesBox").innerHTML += buildRoleChildHtml(option.text, option.index);
    optionEnabled(selectList.selectedIndex, false);
    checkRCP(option, true);
    ResetIndex();
}

function addProgramme() {
    var selectList = document.getElementById('codeProgramme');
    var option = selectList.options[selectList.selectedIndex];
    document.getElementById("codeProgrammeBox").innerHTML += buildRoleChildHtml(option.text, option.index);
    optionEnabled(selectList.selectedIndex, false);
    ResetIndex();
}

function buildRoleChildHtml(nom, index) {
    id = "role" + index;
    return html =
        "<div id='" + id + "'class='child-field clearfix'>" +
            "<p>" + nom + "</p>" +
            "<span  onclick='removeRole(" + index + ")' class='glyphicon glyphicon-remove'></span>" +
            "<input type='hidden' name='roles' value='" + nom + "' />" +
        "</div>";
}

function buildCodeProgrammeChildHtml(nom, index) {
    id = "codeProgramme" + index;
    return html =
        "<div id='" + id + "'class='child-field clearfix'>" +
        "<p>" + nom + "</p>" +
        "<span  onclick='removeCodeProgramme(" + index + ")' class='glyphicon glyphicon-remove'></span>" +
        "<input type='hidden' name='codeProgrammes' value='" + nom + "' />" +
        "</div>";
}


function removeRole(index) {
    var roleNode = document.getElementById("role" + index);
    var option = document.getElementById('roles').options[index];
    checkRCP(option, false);
    optionEnabled(index, true);
    roleNode.remove();
}

function removeCodeProgramme(index) {
    var roleNode = document.getElementById("codeProgramme" + index);
    var option = document.getElementById('codeProgrammes').options[index];
    optionEnabled(index, true);
    roleNode.remove();
}

function loadRole(role) {
    var option = findOptionByValue(role);
    optionEnabled(option.index, false);
    document.getElementById('roles').selectedIndex = option.index;
    addRole();
}

function findOptionByValue(value) {
    var options = document.querySelectorAll("#roles option");
    for (var i = 0; i < options.length; i++) {
        console.log(options[i].value);
        if (options[i].value === value)
            return options[i];
    }
}
