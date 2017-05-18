<%--
  Created by IntelliJ IDEA.
  User: alibct
  Date: 2017/3/15
  Time: 下午12:57
  Desc: Markdown 编辑器
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String bloggerName = (String) session.getAttribute("bloggerName");
    Long bloggerId = (Long) session.getAttribute("bloggerId");
    if (null == bloggerName || bloggerName.length() <= 0) {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/editormd.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/fileinput.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/sweetalert.css"/>
    <style>
        body {
            padding-top: 70px;
        }
    </style>
</head>
<body>
<!-- 导航 -->
<div id="iBlogNav">
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- 实现内补充 -->
            <div class="container-fluid">
                <!-- 头部 -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/">
                        <img alt="Brand" style="width: 32px;height: 18px"
                             src="<%=request.getContextPath()%>/static/images/iBlog.png">
                    </a>
                </div>

                <!-- 右侧 -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="<%=request.getContextPath()%>/">发现</a></li>
                        <li><a href="#">关注</a></li>
                    </ul>

                    <div class="navbar-right">
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-haspopup="true" aria-expanded="false">
                                    <%=bloggerName%>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="<%=request.getContextPath()%>/bloggerIndex/<%=bloggerId%>"><span
                                            class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;我的主页</a>
                                    </li>
                                    <li><a href="#"><span class="glyphicon glyphicon-bookmark"></span>&nbsp;&nbsp;收藏的文章</a>
                                    </li>
                                    <li><a href="#"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;喜欢的文章</a>
                                    </li>
                                    <li><a href="<%=request.getContextPath()%>/bloggerCenter/<%=bloggerId%>"><span
                                            class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;个人信息</a>
                                    </li>
                                    <li><a href="#"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;退出</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <button class="btn btn-info navbar-btn" id="btnSaveBlogger" style="margin-left: 10px"><i
                                class="fa fa-save"></i>&nbsp;&nbsp;保存
                        </button>
                    </div>

                </div>
            </div>

        </div>
    </nav>
</div>
<div class="container">
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1">
            <p class="text-center">
                <img class="img-circle" id="avatar" src="${blogger.bloggerAvatar}" alt="${blogger.bloggerName}"
                     style="width: 90px;height: 90px;">
            </p>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1">
            <p class="text-center">
                上传修改头像
            </p>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1">
            <form class="form-horizontal">
                <div class="form-group">
                    <label for="bloggerAvatarUploader" class="col-lg-2 control-label">上传修改头像</label>
                    <div class="col-lg-9">
                        <input type="file" class="form-control" id="bloggerAvatarUploader" name="image">
                    </div>
                </div>
                <div class="form-group">
                    <label for="bloggerId" class="col-lg-2 control-label">博主Id</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="bloggerId"
                               placeholder="博主Id" value="${blogger.bloggerId}" disabled>
                    </div>
                </div>
                <div class="form-group">
                    <label for="bloggerAccount" class="col-lg-2 control-label">博主账号</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="bloggerAccount"
                               placeholder="博主账号" value="${blogger.bloggerAccount}" disabled>
                    </div>
                </div>
                <div class="form-group">
                    <label for="bloggerName" class="col-lg-2 control-label">博主昵称</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="bloggerName"
                               placeholder="博主昵称" value="${blogger.bloggerName}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="bloggerProfile" class="col-lg-2 control-label">博主简介</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="bloggerProfile"
                               placeholder="博主简介" value="${blogger.bloggerProfile}">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/editormd.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/fileinput.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/zh.js"></script>
<script src="<%=request.getContextPath()%>/static/js/sweetalert.min.js"></script>
<script type="text/javascript">
    var bloggerAvatarUploader = $('#bloggerAvatarUploader');
    var btnSaveBlogger = $('#btnSaveBlogger');
    var avatarUrl = "";
    $(function () {
        bloggerAvatarUploader.fileinput({
            language: 'zh', // 设置语言
            uploadUrl: '<%=request.getContextPath()%>/upload/avatar/image', // 上传地址
            allowedFileExtensions: ['jpg', 'png', 'gif', 'jpeg'], // 允许上传的文件后缀
            showRemove: true, // 是否显示移除按钮
            removeClass: 'btn btn-warning', // 移除按钮主题
            showUpload: false, // 是否显示上传按钮
            showCaption: true, // 是否显示标题
            dropZoneEnabled: false,
            minFileCount: 1, // 最少文件数量
            maxFileCount: 1, // 最多文件数量
            enctype: 'multipart/form-data'
        });

        bloggerAvatarUploader.on('fileuploaded', function (event, data) {
            var response = data.response;
            var avatar = window.document.getElementById('avatar');
            avatar.src = response["url"];
            console.log(avatar.src);
            avatarUrl = response["url"];
        });
    });

    btnSaveBlogger.bind('click', function () {
        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath()%>/update/blogger',
            data: {
                "bloggerId":<%=bloggerId%>,
                "bloggerName": $('#bloggerName').val(),
                "bloggerProfile": $('#bloggerProfile').val(),
                "bloggerAvatar": avatarUrl
            },
            async: true,
            success: function (response) {
                if (response["success"] === 1) {
                    sweetAlert({title: "提示信息", text: response["message"], type: "success"}, function () {
                        window.location.reload();
                    });
                } else {
                    sweetAlert({title: "提示信息", text: response["message"], type: "error"}, function () {
                        window.location.reload();
                    });
                }
            },
            error: function (errorMessage) {
                console.log(errorMessage);
            }
        });
    });
</script>
</body>
</html>
