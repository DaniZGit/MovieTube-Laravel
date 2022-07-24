$( document ).ready(function() {
    $("#menu-button").click(function expandMenu(params) {
        if($("#menu-button").attr("expanded") == "false"){
            $(".main-nav").css("transform", "translateX(0%)");
            //$(".main-nav").css("transition", "transform 0.5s");
            $("#menu-button").attr("expanded", "true");
        } else {
            $(".main-nav").css("transform", "translateX(100%)");
            //$(".main-nav").css("transition", "transform 0.5s");
            $("#menu-button").attr("expanded", "false");
        }
    })
});


window.onresize = function() {
    if (window.innerWidth >= 800) {
        $("#menu-button").attr("expanded", "false");
        $(".main-nav").css("transition", "transform 0s");
    } else {
        $(".main-nav").css("transition", "transform 0.5s");
    }
}