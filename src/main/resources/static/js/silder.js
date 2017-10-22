$(document).ready(function(){
    var index=0;
    var length=$("#img img").length;
    var i=1;

    //关键函数：通过控制i ，来显示图片
    function showImg(i){
        $("#img img")
            .eq(i).stop(true,true).fadeIn(800)
            .siblings("img").hide();
        $("#cbtn li")
            .eq(i).addClass("hov")
            .siblings().removeClass("hov");
    }

    function slideNext(){
        if(index >= 0 && index < length-1) {
            ++index;
            showImg(index);
        }else{
            return false;
        }
        if(i<0 || i>length-3) {return false;}
        $("#cSlideUl ul").animate({ "left": "-=142px" },200);
        i++;
    }

    function slideFront(){
        if(index >= 1 ) {
            --index;
            showImg(index);
        }
        if(i<2 || i>length+3) {return false;}
        $("#cSlideUl ul").animate({ "left": "+=142px" },200)
        i--;
    }
    $("#img img").eq(0).show();
    $("#cbtn li").eq(0).addClass("hov");
    $("#cbtn tt").each(function(e){
        var str=(e+1)+"/"+length;
        $(this).html(str)
    })

    $(".picSildeRight,#next").click(function(){
        slideNext();
    })
    $(".picSildeLeft,#front").click(function(){
        slideFront();
    })
    $("#cbtn li").click(function(){
        index  =  $("#cbtn li").index(this);
        showImg(index);
    });
    $("#next,#front").hover(function(){
        $(this).children("a").fadeIn();
    },function(){
        $(this).children("a").fadeOut();
    })
});
