$(function () {
    var basePath = getPathNoName();
    $.ajax({
        type:'get',
        url:basePath+'hotSearch',
        success:function (result) {
            var htm = '';
            for(var i=0;i<result.length;i++){
                if(result[i].hotSearchBz==1){
                    htm+='<li><a href="'+basePath+'/search?key='+result[i].hotSearchCt+'" style="color: red;">'+result[i].hotSearchCt+'</a></li>';
                }else{
                    htm+='<li><a href="'+basePath+'/search?key='+result[i].hotSearchCt+'" style="color: #aaa;">'+result[i].hotSearchCt+'</a></li>';
                }

            }
            $("#hotSearch").html(htm);
        }
    })
});