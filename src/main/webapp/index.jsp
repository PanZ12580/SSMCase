<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>图书浏览</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/books.js" type="text/javascript" charset="UTF-8"></script>
    <style>
        body{ padding-bottom: 100px; }
    </style>
</head>
<body>
    <div class="container">
        <header class="page-header">
            <div class="row clearfix">
                <div class="col-md-12">
                    <h1 class="text-center">图书信息</h1>
                </div>
            </div>
        </header>
        <main>
            <div class="row clearfix">
                <div class="col-md-2 top-left">
                    <a class="btn btn-primary" href="insert.jsp">新增</a>
                </div>
                <div class="col-md-3 col-md-offset-7 top-right">
                    <form class="form-inline">
                        <div class="form-group">
                            <label class="sr-only" for="query">Query</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="query" placeholder="请输入查询关键字">
                            </div>
                        </div>
                        <button id="query_btn" type="button" class="btn btn-primary">查询</button>
                    </form>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-12">
                    <table class="table table-responsive table-hover table-striped">
                        <thead>
                            <tr>
                                <th class="col-md-1 text-center">书籍编号</th>
                                <th class="col-md-2 text-center">书籍名称</th>
                                <th class="col-md-3 text-center">图片</th>
                                <th class="col-md-1 text-center">书籍数量</th>
                                <th class="col-md-3 text-center">书籍描述</th>
                                <th class="col-md-2 text-center">操作</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
        <footer class="navbar navbar-default navbar-fixed-bottom">
            <div class="text-center" style="padding-top: 10px;">
                <strong>第
                    <span id="currentPage"></span>页,
                    共<span id="totalPage"></span>页</strong>
            </div>
            <div class="row clearfix">
                <nav aria-label="Page navigation">
                    <div class="row col-md-12 text-center">
                        <ul id="pager" class="pagination">
                        </ul>
                    </div>
                </nav>
            </div>
        </footer>
    </div>
    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="display: none;">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="row clearfix">
                    <div class="col-md-12">
                        <h1 class="text-center">修改图书信息</h1>
                    </div>
                </div>
                <form id="updateForm" class="form-horizontal">
                    <div class="form-group">
                        <label for="bookName" class="col-sm-2 control-label">图书名称</label>
                        <div class="col-sm-8">
                            <input required type="text" class="form-control" id="bookName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="img" class="col-sm-2 control-label">图片</label>
                        <input type="file" id="img" class="col-sm-3 control-label">
                        <div class="col-sm-7">
                            <img id="bookImg" width="150" height="150" class="img-responsive img-rounded">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bookCount" class="col-sm-2 control-label">图书数量</label>
                        <div class="col-sm-8">
                            <input required type="text" class="form-control" id="bookCount">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="detail" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-8">
                            <textarea required class="form-control" rows="3" id="detail"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12 text-center">
                            <button id="sub_change" type="button" class="btn btn-default">提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function update(item, bookId) {
            $.ajax({
                url:"book/findBook",
                type:"get",
                data:"bookId="+ bookId +"",
                dataType:"json",
                success:function (data) {
                    $("#bookName").val(data.bookName);
                    $("#bookImg").prop("src", data.bookImg);
                    $("#bookCount").val(data.bookCount);
                    $("#detail").html(data.detail);
                }
            });

            $("#img").change(function () {
                var file = new FileReader();
                var img = $("#img")[0].files[0];
                file.readAsDataURL(img);
                file.onload = function () {
                    $("#bookImg").prop("src", this.result);
                }
            });

            $("#sub_change").click(function () {
                var formData = new FormData();
                var file = $("#img").get(0).files[0];
                formData.append("file", file);
                var items = JSON.stringify({
                    "bookId":bookId,
                    "bookName":$("#bookName").val(),
                    "bookCount":$("#bookCount").val(),
                    "detail":$("#detail").val()
                });
                formData.append("items", new Blob([items], {type: "application/json"}));
                $.ajax({
                    url:"book/updateBook",
                    type:"post",
                    //忽略contentType
                    contentType:false,
                    //取消序列化转换，formData已经是序列化好的了
                    processData:false,
                    dataType:"json",
                    data:formData,
                    async:false,
                    success:function (res) {
                        if(res.flag){
                            alert("修改成功！");
                            location.reload();
                        }else{
                            alert("出现异常，添加失败！");
                        }
                    },

                });
            });
        }

        function deleteBook(bookId) {
            var flag = confirm("确认删除？");
            if(flag){
                $.ajax({
                    url:"book/deleteBook",
                    type:"get",
                    data:"bookId="+ bookId +"",
                    dataType:"json",
                    success:function (data) {
                        if(data.flag){
                            alert("删除成功！");
                            location.reload();
                        }else{
                            alert("出现异常，删除失败！");
                        }
                    }
                });
            }
        }
    </script>
</body>
</html>