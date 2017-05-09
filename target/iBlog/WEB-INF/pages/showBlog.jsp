<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: alibct
  Date: 2017/4/21
  Time: 下午4:53
  Desc: 查看博文页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String bloggerName = (String) session.getAttribute("bloggerName");
    String bloggerAvatar = (String) session.getAttribute("bloggerAvatar");
    Long bloggerId = (Long) session.getAttribute("bloggerId");
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${blogDetail.blogTitle}</title>
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
                    <a href="<%=request.getContextPath()%>/login" class="btn btn-success navbar-btn"
                       id="btnLogin"><i
                            class="fa fa-user"></i>&nbsp;&nbsp;登录
                    </a>
                    <ul id="dropdownMenu" class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">
                                <%=bloggerName%>
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
    <!-- title -->
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <h2>${blogDetail.blogTitle}</h2>
        </div>
    </div>
    <!-- userInfo -->
    <div class="row vertical-align" style="padding-top: 20px">
        <div class="col-lg-1 col-lg-offset-2">
            <!--用户信息-->
            <img class="img-circle" src="${blogger.bloggerAvatar}" alt="${blogger.bloggerName}"
                 style="width: 60px;height: 60px;">
        </div>
        <div class="col-lg-7">
            <!--用户信息-->
            <div class="row">
                <label class="label label-danger"><span class="glyphicon glyphicon-user"></span>博主</label>
                <span>${blogger.bloggerName}</span>
                <label class="label label-success" id="btnStar" role="button" style="margin-left: 10px"><span
                        class="glyphicon glyphicon-plus"></span>关注</label>
            </div>
            <div class="row" style="padding-top: 8px">
                <span class="text-muted">${createAt} |</span>
                <span class="text-muted">字数 ${blogDetail.wordCount} |</span>
                <span class="text-muted">阅读 ${blogDetail.blogHits} |</span>
                <span class="text-muted">评论 ${blogDetail.blogComments} |</span>
                <span class="text-muted">喜欢 ${blogDetail.blogStars}</span>
            </div>
        </div>
    </div>
    <!-- content -->
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2" id="content">
            <textarea style="display:none;">${blogDetail.blogMarkdownContent}</textarea>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <hr>
        </div>
    </div>

    <%--评论区域--%>
    <div class="row" style="margin-top: 30px">
        <div class="col-lg-1 col-lg-offset-2" id="commentField">
            <%
                if (null == bloggerAvatar) {
            %>
            <img class="img-circle" src="<%=request.getContextPath()%>/static/images/thum.png" alt="用户"
                 style="width: 70px;height: 70px;">
            <%
            } else {
            %>
            <img class="img-circle" src="<%=bloggerAvatar%>" alt="<%=bloggerName%>"
                 style="width: 70px;height: 70px;">
            <%
                }
            %>
        </div>
        <div class="col-lg-7">
            <%
                if (null == bloggerAvatar) {
            %>
            <div class="jumbotron">
                <p class="lead">请先<a href="<%=request.getContextPath()%>/login" class="btn-xs btn-info"
                                     style="font-size: 20px">登录</a>后再做评论</p>
            </div>
            <%
            } else {
            %>
            <textarea class="form-control" rows="3" placeholder="请写下你的评论" id="commentContent"></textarea>
            <%
                }
            %>
        </div>
    </div>
    <div class="row" style="margin-top: 10px">
        <%
            if (null != bloggerAvatar) {
        %>
        <div class="col-lg-1 col-lg-offset-9">
            <button class="btn btn-success form-control" id="sendComments">发送</button>
        </div>
        <%
            }
        %>
    </div>
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <hr>
        </div>
    </div>
    <div class="row" style="margin-top: 30px">
        <div class="col-lg-8 col-lg-offset-2">
            <h4>${commentsCount}条评论</h4>
        </div>
    </div>
    <div id="showComments" style="margin-bottom: 20px">
        <c:forEach items="${comments}" var="comment" varStatus="status">
            <div class="row" style="margin-top: 20px">
                <div class="row vertical-align">
                    <div class="col-lg-1 col-lg-offset-2">
                        <img class="img-circle" src="${commentBloggers.get(status.index).bloggerAvatar}"
                             alt="${commentBloggers.get(status.index).bloggerName}"
                             style="width: 70px;height: 70px;">
                    </div>
                    <div class="col-lg-9">
                        <label class="label label-success">${commentBloggers.get(status.index).bloggerName}</label>
                        <span class="text-muted">${commentTimeList.get(status.index)}</span>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px">
                    <div class="col-lg-9 col-lg-offset-3">
                        <p>${comment.commentContent}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
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
    var btnLogin = $('#btnLogin');
    var dropdownMenu = $('#dropdownMenu');
    var btnStar = $('#btnStar');
    var btnWriteBlog = $('#btnWriteBlog');

    var commentContent = $('#commentContent');
    var sendComments = $('#sendComments');


    $(function () {
        var bloggerName = '<%=bloggerName%>';
        if (bloggerName === 'null') {
            dropdownMenu.css("display", "none");
        } else {
            btnLogin.css("display", "none");
            if (bloggerName === '${blogger.bloggerName}') {
                btnStar.css("display", "none");
            } else {
                // 如果不是本人就需要获取关注状态
                // 需要进行ajax请求
                $.ajax({
                    type: 'get',
                    url: '<%=request.getContextPath()%>/bloggerStars',
                    data: {"bloggerId":<%=bloggerId%>, "starBloggerId":${blogger.bloggerId}},
                    async: false,
                    success: function (response) {
                        if (response["success"] === 1) {
                            btnStar.text("取消关注");
                        }
                    },
                    error: function (errorMessage) {
                        console.log(errorMessage);
                    }
                });
            }


            // 绑定评论按钮事件
            sendComments.bind('click', function () {
                // ajax评论
                $.ajax({
                    type: 'post',
                    url: '<%=request.getContextPath()%>/comments',
                    data: {
                        "blogId":${blogDetail.blogId},
                        "commentContent": commentContent.val(),
                        "commentBy":<%=bloggerId%>
                    },
                    async: false,
                    success: function (response) {
                        if (response["success"] === 1) {
                            sweetAlert({title: "添加成功!", text: "评论成功!", type: "success"}, function () {
                                location.reload();
                            });
                        }
                    },
                    error: function (errorMessage) {
                        console.log(errorMessage);
                    }
                });
                // 添加到评论区域最前面
            });
        }
        btnStar.bind('click', function () {

            if (bloggerName === 'null') {
                sweetAlert({title: "出错啦!", text: "想关注别人必须先登录哦!", type: "error"}, function () {
                    window.location.href = "<%=request.getContextPath()%>/login";
                });
            } else {
                if (btnStar.text() === "关注") {
                    // 进行ajax请求
                    $.ajax({
                        type: 'post',
                        url: '<%=request.getContextPath()%>/bloggerStars',
                        data: {"bloggerId":<%=bloggerId%>, "starBloggerId":${blogger.bloggerId}},
                        async: false,
                        success: function (response) {
                            if (response["success"] === 1) {
                                btnStar.text("取消关注");
                            }
                        },
                        error: function (errorMessage) {
                            console.log(errorMessage);
                        }
                    });
                } else if (btnStar.text() === "取消关注") {
                    $.ajax({
                        type: 'get',
                        url: '<%=request.getContextPath()%>/bloggerStars/<%=bloggerId%>/${blogger.bloggerId}',
                        async: false,
                        success: function (response) {
                            if (response["success"] === 1) {
                                btnStar.text("关注");
                            }
                        },
                        error: function (errorMessage) {
                            console.log(errorMessage);
                        }
                    });
                }
            }
        });
        var content = editormd.markdownToHTML("content", {
            htmlDecode: "style,script,iframe",  // you can filter tags decode
            emoji: true,
            taskList: true,
            tex: true,  // 默认不解析
            flowChart: true,  // 默认不解析
            sequenceDiagram: true   // 默认不解析
        });
    });
    btnWriteBlog.bind('click', function () {
        var bloggerName = '<%=bloggerName%>';
        if (bloggerName === 'null') {
            swal({
                    title: "提示信息",
                    text: "写博客需要先登录哦!是否现在登录?",
                    type: "info",
                    showCancelButton: true,
                    cancelButtonText: "取消",
                    confirmButtonText: "确定",
                    closeOnConfirm: true
                },
                function () {
                    window.location.href = "<%=request.getContextPath()%>/login";
                });
        } else {
            window.open("<%=request.getContextPath()%>/editor", "_blank");
        }
    });
</script>
</body>
</html>
