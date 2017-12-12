$(document).ready(function () {
    var hour = new Date().getHours();
    console.log(hour);
    if (hour < 6 || hour >= 18) {
        console.log("yeed");
        $('#portail').css('background-image', 'url(../Content/Images/cegep2.jpg)');
        $('#main').css('background-image', 'url(../Content/Images/cegep2-frost.jpg)');
    }
});
