var hour = new Date().getHours();
if (hour < 6 || hour >= 18) {
    var div = document.getElementsByClassName("portail")[0];
    div.style.backgroundImage = "url(../Content/Images/cegep2.jpg)";
}