var rolesDropDown;
var codeProgrammeDropDown;

$(document).ready(function () {
    rolesDropDown = SelectionModuleFor('role', 'rôle');
    codeProgrammeDropDown = SelectionModuleFor('codeProgramme', 'programme');
});

function SelectionModuleFor(dropDownName, displayName) {

    this.dropDownName = dropDownName;
    this.boxName = dropDownName + "Box";
    this.displayName = displayName;

    var initDropDown = function () {
        var selectList = document.getElementById(this.dropDownName);
        var option = document.createElement("option");
        option.text = "Selectionnez un " + this.displayName;
        selectList.insertBefore(option, selectList.firstChild);
        optionEnabled(0, false);
        resetIndex();
    }

    var resetIndex = function () {
        document.getElementById(this.dropDownName).selectedIndex = "0";
    }

    var optionEnabled = function optionEnabled (index, state) {
        document.getElementById(this.dropDownName).options[index].disabled = !state;
    }

    var buildChildHtml = function (nom, index) {
        id = this.dropDownName + index;
        return html =
            "<div id='" + id + "'class='child-field clearfix'>" +
            "<p>" + nom + "</p>" +
            "<span  onclick='removeItem(" + index + ")' class='glyphicon glyphicon-remove'></span>" +
            "<input type='hidden' name='" + this.dropDownName + "' value='" + nom + "' />" +
            "</div>";
    }

    var addItem = function () {
        var selectList = document.getElementById(this.dropDownName);
        var option = selectList.options[selectList.selectedIndex];
        document.getElementById(this.boxName).innerHTML += buildChildHtml(option.text, option.index);
        optionEnabled(selectList.selectedIndex, false);
        resetIndex();
    }

    var removeItem = function (index) {
        var node = document.getElementById(this.dropDownName + index);
        var option = document.getElementById(this.dropDownName).options[index];
        optionEnabled(index, true);
        role.remove();
    }

    var findOptionByValue = function (value) {
        var options = document.querySelectorAll(this.dropDownName + "# option");
        for (var i = 0; i < options.length; i++) {
            console.log(options[i].value);
            if (options[i].value === value)
                return options[i];
        }
    }

    initDropDown();

    document.getElementById(this.dropDownName).addEventListener("onchange", addItem());
}

function rcpFormVisible(state) {
    if (state)
        document.getElementById("RCPForm").style.display = "block";
    else
        document.getElementById("RCPForm").style.display = "none";
}

function checkRcp(option, state) {
    if (option.value === "RCP")
        rcpFormVisible(state);
}

function addRole() {
    var selectList = document.getElementById('roles');
    var option = selectList.options[selectList.selectedIndex];
    document.getElementById("rolesBox").innerHTML += buildRoleChildHtml(option.text, option.index);
    optionEnabled(selectList.selectedIndex, false);
    checkRcp(option, true);
    resetIndex();
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
    checkRcp(option, false);
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
