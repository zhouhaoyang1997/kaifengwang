$('#collectionTable').bootstrapTable({
    pagination: true, //分页
    url:'/user/collectionPush',
    method: 'get',
    cache: false,
    pageNumber: 1,   //初始化加载第一页，默认第一页
    pageSize: 10,
    columns: [{
        field: 'piTitle',
        title: '信息标题',
        formatter:function (value,row,index) {
            if(value.length>7){
                return '<a href="/info?piId='+row.piId+'" target="_blank">'+value.substr(0,6)+"..."+'</a>';
            }else{
                return '<a href="/info?piId='+row.piId+'" target="_blank">'+value+'</a>';
            }
        }
    }, {
        field: 'mcName',
        title: '所属主分类'
    }, {
        field: 'scName',
        title: '所属副分类'
    },{
        field: 'piPushDate',
        title: '发布日期',
        formatter:function (value,row,index) {
            var unixTimestamp = new Date( value ) ;
            return  unixTimestamp.toLocaleString();

        }
    },{
        field:'option',
        title:'操作',
        formatter:function (value,row,index) {
            return '<a onclick="removeCollect('+row.piId+')"  href="javascript:;">删除</a>';
        }
    }]
});

$('#table').bootstrapTable({
    pagination: true, //分页
    url:'/user/allPush',
    method: 'get',
    cache: false,
    pageNumber: 1,   //初始化加载第一页，默认第一页
    pageSize: 5,
    columns: [{
        field: 'piTitle',
        title: '信息标题',
        formatter:function (value,row,index) {
            if(value.length>7){
                return '<a href="/info?piId='+row.piId+'" target="_blank">'+value.substr(0,6)+"..."+'</a>';
            }else{
                return '<a href="/info?piId='+row.piId+'" target="_blank">'+value+'</a>';
            }
        }
    }, {
        field: 'mcName',
        title: '所属主分类'
    }, {
        field: 'scName',
        title: '所属副分类'
    },{
        field: 'piPushDate',
        title: '发布日期',
        formatter:function (value,row,index) {
            var unixTimestamp = new Date( value ) ;
            return  unixTimestamp.toLocaleString();

        }
    },{
        field: 'piChujia',
        title: '竞价排行'
    },{
        field: 'piZhiding',
        title: '大类置顶'
    },{
        field:'status',
        title:'状态',
        formatter:function (value,row,index) {
            switch (value){
                case 0:
                    return '正常显示';
                case 1:
                    return '等待审核';
            }
        }
    },{
        field:'option',
        title:'操作',
        formatter:function (value,row,index) {
            var s = '<a href="/user/alterInfo?piId='+row.piId+'">修改</a>';
            var d = '<a id="remove" data-toggle="modal" href="javascript:void(0)" onclick="removePushInfo('+row.piId+')">删除</a>';
            return s+' '+d;
        }
    }]
});

function removeCollect(piId) {
    confirm("删除该条收藏记录","您确认删除该条收藏吗?该操作不可回退!",function (flag) {
        if(flag){
            $.ajax({
                url:'/user/deleteCollect?piId='+piId,
                type:'get',
                success:function (result) {
                  if(result){
                      alert("删除成功!");
                      $("#collectionTable").bootstrapTable("refresh",{
                          url:'/user/collectionPush'
                      });
                  }else{
                      alert("服务器段发生了错误,请稍后再试!");
                  }
                }
            })
        }
    })
}


$("#removeBtn").click(function () {
    $.ajax({
        url:'/user/deleteInfo?piId='+$("#piIdHidden").val(),
        type:'get',
        success:function (result) {
            var res=result.split(":");
            if(res[0]==="ok"){
                //刷新bootstrap-table
                $("#table").bootstrapTable("refresh",{
                    url:'/user/allPush'
                });
                $("#deleteModal").modal("hide");
            }else{
                $("#deleteModal").modal("hide");
                alert(res[1]);
            }
        }
    })
});

function removePushInfo(piId) {
    confirm("删除该条收藏记录","您确认删除该条收藏吗?该操作不可回退!",function (flag) {
        if(flag){
            $.ajax({
                url:'/user/deleteInfo?piId='+piId,
                type:'get',
                success:function (result) {
                    var res=result.split(":");
                    if(res[0]==="ok"){
                        //刷新bootstrap-table
                        $("#table").bootstrapTable("refresh",{
                            url:'/user/allPush'
                        });
                    }else{
                        alert(res[1]);
                    }
                }
            })
        }
})
}