$(function () {
    load(1, null);
    $("#query_btn").click(function () {
        load(1, $("#query").val());
    });
});

function load(currentPage, query) {
    $.ajax({
        url:"book/allBook",
        contentType:"application/json;charset=utf-8",
        data:'{"page": "5", "currentPage": "'+ currentPage +'", "query": "'+ query +'"}',
        dataType:"json",
        type:"post",
        success:function (data) {
            //设置当前页及总页数提示
            $("#currentPage").html(data.currentPage);
            $("#totalPage").html(data.totalPage);

            //设置分页条，仿照百度前5后4规则
            var begin = data.currentPage-5;
            var end = data.currentPage+4;
            //小于10页直接显示
            if(data.totalPage <= 10){
                begin = 1;
                end = data.totalPage;
            }
            //begin前不足5页，让页码从1到10
            if(begin <= 0){
                begin = 1;
                end = begin+9
            }
            //end后不足4页，让页码从倒数第十到倒数第一
            if(end > data.totalPage){
                end = data.totalPage;
                begin = end-9;
            }
            //拼页码，从首页开始
            var beforePage = data.currentPage-1 < 1? 1 : data.currentPage-1;
            var afterPage = data.currentPage+1 > data.totalPage? data.totalPage : data.currentPage+1;
            if(data.currentPage == 1){
                var lis = '<li class="previous disabled" onclick="load(1, \''+ query +'\')"><a href="javascript:void(0);">首页</a></li>\n' +
    '                      <li class="previous disabled" onclick="load('+ beforePage +', \''+ query +'\')"><a href="javascript:void(0);"><span aria-hidden="true">&larr;</span>上一页</a></li>';
            }else{
                var lis = '<li class="previous" onclick="load(1, \''+ query +'\')"><a href="javascript:void(0);">首页</a></li>\n' +
    '                      <li class="previous" onclick="load('+ beforePage +', \''+ query +'\')"><a href="javascript:void(0);"><span aria-hidden="true">&larr;</span>上一页</a></li>';
            }

            for(var i = begin; i <= end; i++){
            //    将当前页设置为激活状态
                if(i == data.currentPage){
                    var li = '<li class="active" onclick="load('+ i +', \''+ query +'\')"><a href="javascript:void(0);">'+ i +'</a></li>';
                }else{
                    var li = '<li onclick="load('+ i +', \''+ query +'\')"><a href="javascript:void(0);">'+ i +'</a></li>';
                }
                lis += li;
            }
            if(data.currentPage == data.totalPage){
                lis += '<li class="next disabled" onclick="load('+ data.totalPage +', \''+ query +'\')"><a href="javascript:void(0);">尾页</a></li>\n' +
    '                   <li class="next disabled" onclick="load('+ afterPage +', \''+ query +'\')"><a href="javascript:void(0);">下一页<span aria-hidden="true">&rarr;</span></a></li>';
            }else{
                lis += '<li class="next" onclick="load('+ data.totalPage +', \''+ query +'\')"><a href="javascript:void(0);">尾页</a></li>\n' +
    '                   <li class="next" onclick="load('+ afterPage +', \'' + query + '\')"><a href="javascript:void(0);">下一页<span aria-hidden="true">&rarr;</span></a></li>';
            }
            $("#pager").html(lis);

            //追加内容
            var tbody = "";
            var list = data.bookList;
            $.each(list, function (index, content) {
                var tr = '<tr>\n' +
                    '                                <td class="text-center">'+ content.bookId +'</td>\n' +
                    '                                <td class="text-center">'+ content.bookName +'</td>\n' +
                    '                                <td class="text-center">\n' +
                    '                                    <img class="img-responsive center-block img-rounded" width="100" height="100" src="'+ content.bookImg +'">\n' +
                    '                                </td>\n' +
                    '                                <td class="text-center">' + content.bookCount + '</td>\n' +
                    '                                <td>' + content.detail + '</td>\n' +
                    '                                <td class="text-center">\n' +
                    '                                    <button type="button" class="btn btn-default" data-toggle="modal" data-target=".modal" onclick="update(this, '+ content.bookId +')">修改</button>\n' +
                    '                                    &nbsp; | &nbsp;\n' +
                    '                                    <a class="btn btn-default" href="javscript:void(0);" onclick="deleteBook('+ content.bookId +')">删除</a>\n' +
                    '                                </td>\n' +
                    '                            </tr>\n + ';
                tbody += tr;
            });
            $("#tbody").html(tbody);
        }
    });
}

