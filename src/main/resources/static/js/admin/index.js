function menuSelected(name) {
    $("#menuList").removeClass("active");
    $("#" + name).addClass("active");
}
