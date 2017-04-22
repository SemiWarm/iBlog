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
    if (null == bloggerName || bloggerName.length() <= 0) {
        response.sendRedirect(request.getContextPath() + "/");
    }
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Markdown 编辑器</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/editormd.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css"/>
    <style>
        body {
            padding-top: 50px;
        }
    </style>
</head>
<body>
<!-- 导航 -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!-- 实现内补充 -->
        <div class="container-fluid">
            <!-- 头部 -->
            <div class="navbar-header">
                <a class="navbar-brand" href="<%=request.getContextPath()%>/main">
                    <img alt="Brand" style="width: 32px;height: 18px"
                         src="<%=request.getContextPath()%>/static/images/iBlog.png">
                </a>
            </div>

            <!-- 右侧 -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/main">发现</a></li>
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
                                <li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;我的主页</a></li>
                                <li><a href="#"><span class="glyphicon glyphicon-bookmark"></span>&nbsp;&nbsp;收藏的文章</a>
                                </li>
                                <li><a href="#"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;喜欢的文章</a>
                                </li>
                                <li><a href="#"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;退出</a></li>
                            </ul>
                        </li>
                    </ul>
                    <button class="btn btn-info navbar-btn" id="btnSavaBlog" style="margin-left: 10px"><i
                            class="fa fa-save"></i>&nbsp;&nbsp;保存
                    </button>
                </div>

            </div>
        </div>

    </div>
</nav>

<div id="container">
    <div class="row">
        <div class="col-lg-12">
            <div id="mdEditor">
                <textarea class="editormd-markdown-textarea" name="markdown-area" style="display:none;"># 请输入标题</textarea>
                <textarea class="editormd-html-textarea" name="html-area"></textarea>
            </div>
        </div>
    </div>
</div>
<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/editormd.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    var editor;
    $(function () {
        editor = editormd("mdEditor", {
            width: "90%",
            height: 640,
            path: "<%=request.getContextPath()%>/static/lib/",
            saveHTMLToTextarea: true,
            emoji: true,
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL: "<%=request.getContextPath()%>/upload/editormd/images",
            onfullscreen:function () {
                $('.editormd-fullscreen').css('position','relative');
            },
            onfullscreenExit : function() {
                $('.editormd-fullscreen').css("position",'');
            }
        });
    });

    $("#btnSavaBlog").bind('click', function () {
        alert(editor.getHTML());
    });
</script>
</body>
</html>
