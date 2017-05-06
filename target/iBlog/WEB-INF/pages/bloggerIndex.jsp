<%--
  Created by IntelliJ IDEA.
  User: alibct
  Date: 2017/4/21
  Time: 下午4:53
  Desc: 个人中心
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${blogger.bloggerName}-个人中心</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/editormd.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/docs.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/sweetalert.css">
    <style>
        body {
            padding-top: 70px;
        }

        .vertical-align {
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>

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
                    <ul id="dropdownMenu" class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">
                                ${blogger.bloggerName}
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="<%=request.getContextPath()%>/bloggerIndex/<%=bloggerId%>"><span
                                        class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;我的主页</a>
                                </li>
                                <li><a href="#"><span class="glyphicon glyphicon-bookmark"></span>&nbsp;&nbsp;收藏的文章</a>
                                </li>
                                <li><a href="#"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;喜欢的文章</a>
                                </li>
                                <li><a href="<%=request.getContextPath()%>/quit"><span
                                        class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;退出</a></li>
                            </ul>
                        </li>
                    </ul>
                    <button class="btn btn-warning navbar-btn" id="btnWriteBlog" style="margin-left: 10px"><i
                            class="fa fa-pencil"></i>&nbsp;&nbsp;写博客
                    </button>
                </div>

            </div>
        </div>

    </div>
</nav>

<!-- 内容区域 -->
<div class="container">
    <%--用户信息--%>
    <div class="row vertical-align" style="padding-top: 20px">
        <div class="col-lg-1 col-lg-offset-2">
            <!--用户信息-->
            <img class="img-circle" src="${blogger.bloggerAvatar}" alt="${blogger.bloggerName}"
                 style="width: 90px;height: 90px;">
        </div>
        <div class="col-lg-9" style="margin-left: 10px">
            <!--用户信息-->
            <div class="row">
                <div class="col-lg-12">
                    <label class="label label-danger"><span
                            class="glyphicon glyphicon-user"></span>${blogger.bloggerName}</label>
                </div>
            </div>
            <div class="row" style="padding-top: 8px">
                <div class="col-lg-12">
                    <span class="text-muted">${createAt} |</span>
                    <span class="text-muted">关注 99 |</span>
                    <span class="text-muted">粉丝 999 |</span>
                    <span class="text-muted">文章 9 |</span>
                    <span class="text-muted">收获喜欢 999</span>
                </div>
            </div>
            <div class="row" style="padding-top: 8px">
                <div class="col-lg-2">
                    <span class="text-muted">个人简介</span>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-10" style="padding-top: 5px">
                    不会烧菜的程序员不是一个好厨子
                </div>
            </div>
        </div>
    </div>
    <%--文章信息--%>
    <div class="row" style="margin-top: 30px">
        <div class="col-lg-8 col-lg-offset-2">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">文章</a></li>
                <li role="presentation"><a href="#">关注</a></li>
                <li role="presentation"><a href="#">动态</a></li>
            </ul>
        </div>
    </div>
</div>
<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/marked.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/prettify.min.js"></script>

<script src="<%=request.getContextPath()%>/static/js/raphael.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/underscore.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/sequence-diagram.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/flowchart.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/jquery.flowchart.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/editormd.js"></script>
<script src="<%=request.getContextPath()%>/static/js/sweetalert.min.js"></script>
<script type="text/javascript">
</script>
</body>
</html>
