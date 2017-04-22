<%--
  Created by IntelliJ IDEA.
  User: alibct
  Date: 2017/4/21
  Time: 下午4:54
  Desc: 管理页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>管理页面</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <!-- 导航 -->
        <div class="col-lg-12">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="<%=request.getContextPath()%>/admin">主页</a></li>
                <li role="presentation"><a href="<%=request.getContextPath()%>/blogger">博主管理</a></li>
                <li role="presentation"><a href="<%=request.getContextPath()%>/blog">博文管理</a></li>
            </ul>
        </div>
    </div>
</div>

<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
</body>
</html>
