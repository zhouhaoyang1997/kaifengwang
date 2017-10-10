$('#collectionTable').bootstrapTable({
    pagination: true, //分页
    url:'/user/collectionPush',
    method: 'post',
    cache: false,
    pageNumber: 1,   //初始化加载第一页，默认第一页
    pageSize: 5,
    columns: [{
        field: 'piTitle',
        title: '信息标题',
        formatter:function (value,row,index) {
            if(value.length>7){
                return '<a href="${base}/info?piId='+row.piId+'" target="_blank">'+value.substr(0,6)+"..."+'</a>';
            }else{
                return '<a href="${base}/info?piId='+row.piId+'" target="_blank">'+value+'</a>';
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
            return '<a class = "remove" href="javascript:void(0)">删除</a>';
        }
    }]
});

$('#table').bootstrapTable({
    pagination: true, //分页
    url:'/user/allPush',
    method: 'post',
    cache: false,
    pageNumber: 1,   //初始化加载第一页，默认第一页
    pageSize: 5,
    columns: [{
        field: 'piTitle',
        title: '信息标题',
        formatter:function (value,row,index) {
            if(value.length>7){
                return '<a href="${base}/info?piId='+row.piId+'" target="_blank">'+value.substr(0,6)+"..."+'</a>';
            }else{
                return '<a href="${base}/info?piId='+row.piId+'" target="_blank">'+value+'</a>';
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
                    return '已被删除';
                case 2:
                    return '正在等待管理员审核';
            }
        }
    },{
        field:'option',
        title:'操作',
        formatter:function (value,row,index) {
            var s = '<a class = "save" href="javascript:void(0)">修改</a>';
            var d = '<a class = "remove" href="javascript:void(0)">删除</a>';
            return s+' '+d;
        }
    }]
});

$('#deleteTable').bootstrapTable({
    pagination: true, //分页
    url:'/user/deletePush',
    method: 'post',
    cache: false,
    pageNumber: 1,   //初始化加载第一页，默认第一页
    pageSize: 5,
    columns: [{
        field: 'piTitle',
        title: '信息标题',
        formatter:function (value,row,index) {
            if(value.length>7){
                return '<a href="${base}/info?piId='+row.piId+'" target="_blank">'+value.substr(0,6)+"..."+'</a>';
            }else{
                return '<a href="${base}/info?piId='+row.piId+'" target="_blank">'+value+'</a>';
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
            var s = '<a class = "save" href="javascript:void(0)">恢复</a>';
            var d = '<a class = "remove" href="javascript:void(0)">完全删除</a>';
            return s+' '+d;
        }
    }]
});