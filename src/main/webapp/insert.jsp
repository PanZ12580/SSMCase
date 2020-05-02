<%--
  Created by IntelliJ IDEA.
  User: Hzhang
  Date: 2020/5/1
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>新增图书</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script>
        $(function () {
            $("#bookImg").change(function () {
                var file = new FileReader();
                var img = $("#bookImg")[0].files[0];
                file.readAsDataURL(img);
                file.onload = function () {
                    $("#img").prop("src", this.result);
                }
            });
            $("#submit").click(function () {
                var formData = new FormData();
                formData.append("file", $("#bookImg")[0].files[0]);
                var items = JSON.stringify({
                    "bookName":$("#bookName").val(),
                    "bookCount":$("#bookCount").val(),
                    "detail":$("#detail").val()
                });
                formData.append("items", new Blob([items], {type: "application/json"}));
                $.ajax({
                    url:"book/saveBook",
                    type:"post",
                    //忽略contentType
                    contentType:false,
                    //取消序列化转换，formData已经是序列化好的了
                    processData:false,
                    dataType:"json",
                    data:formData,
                    async:false,
                    success:function (res) {
                        if(res.id > 0){
                            alert("添加成功！");
                            location.href = "index.jsp";
                        }else{
                            alert("出现异常，添加失败！");
                        }
                    },

                });
            });
        });
    </script>
</head>
<body>
<div class="container">
    <header class="page-header">
        <div class="row clearfix">
            <div class="col-md-12">
                <h1 class="text-center">新增图书</h1>
            </div>
        </div>
    </header>
    <main>
        <form id="bookForm" class="form-horizontal">
            <div class="form-group">
                <label for="bookName" class="col-sm-2 control-label">图书名称</label>
                <div class="col-sm-10">
                    <input required type="text" class="form-control" id="bookName" placeholder="图书名称">
                </div>
            </div>
            <div class="form-group">
                <label for="bookCount" class="col-sm-2 control-label">图书数量</label>
                <div class="col-sm-10">
                    <input required type="text" class="form-control" id="bookCount" placeholder="图书数量">
                </div>
            </div>
            <div class="form-group">
                <label for="bookImg" class="col-sm-2 control-label">图片</label>
                <input required type="file" id="bookImg" class="col-sm-3 control-label" name="bookImg">
                <div class="col-md-offset-3 col-md-4">
                        <img id="img" style="width: 55%;height: 30%;" class="center-block img-thumbnail">
                </div>
            </div>
            <div class="form-group">
                <label for="detail" class="col-sm-2 control-label">图书描述</label>
                <div class="col-sm-10">
                    <textarea required class="form-control" rows="3" id="detail"></textarea>
                </div>
            </div>
            <div class="text-center">
                <button id="submit" type="button" class="btn btn-default">提交</button>
            </div>
        </form>
    </main>
    <footer>

    </footer>
</div>

</body>
</html>
