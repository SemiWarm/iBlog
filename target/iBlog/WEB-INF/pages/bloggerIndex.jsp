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

        .iBlogContent {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 6;
        }

        .titleContent {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 1;
        }

        .disabled:hover, .disabled:focus {
            /*解决li标签设为disabled后还能点击的bug*/
            pointer-events: none;
            cursor: not-allowed;
            text-decoration: none;
            background-color: transparent;
            opacity: 0.7;
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
                    <a href="<%=request.getContextPath()%>/login" class="btn btn-success navbar-btn" id="btnLogin"><i
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
                                        class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;我的主页</a>
                                </li>
                                <li><a href="#"><span class="glyphicon glyphicon-bookmark"></span>&nbsp;&nbsp;收藏的文章</a>
                                </li>
                                <li><a href="#"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;喜欢的文章</a>
                                </li>
                                <li><a href="<%=request.getContextPath()%>/bloggerCenter/<%=bloggerId%>"><span
                                        class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;个人信息</a>
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
        <div class="col-lg-1 col-lg-offset-1">
            <!--用户信息-->
            <img class="img-circle" src="${blogger.bloggerAvatar}" alt="${blogger.bloggerName}"
                 style="width: 90px;height: 90px;">
        </div>
        <div class="col-lg-10" style="margin-left: 10px">
            <!--用户信息-->
            <div class="row">
                <div class="col-lg-12">
                    <label class="label label-danger"><span
                            class="glyphicon glyphicon-user"></span>${blogger.bloggerName}</label>
                    <label class="label label-success" id="btnStar" role="button" style="margin-left: 10px"><span
                            class="glyphicon glyphicon-plus"></span>关注</label>
                </div>
            </div>
            <div class="row" style="padding-top: 8px">
                <div class="col-lg-12">
                    <span class="text-muted">${createAt} |</span>
                    <span class="text-muted">关注 ${blogStarCount} |</span>
                    <span class="text-muted">粉丝 ${blogStaredCount} |</span>
                    <span class="text-muted">文章 ${blogCount} |</span>
                </div>
            </div>
            <div class="row" style="padding-top: 8px">
                <div class="col-lg-2">
                    <span class="text-muted">个人简介</span>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-10" style="padding-top: 5px">
                    ${blogger.bloggerProfile}
                </div>
            </div>
        </div>
    </div>
    <%--文章信息--%>
    <div class="row" style="margin-top: 30px">
        <div class="col-lg-10 col-lg-offset-1">
            <!-- 导航 tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#blogs" aria-controls="blogs" role="tab"
                                                          data-toggle="tab">文章</a></li>
                <li role="presentation"><a href="#stars" aria-controls="stars" role="tab" data-toggle="tab">关注</a></li>
                <li role="presentation"><a href="#category" aria-controls="category" role="tab" data-toggle="tab">分类</a>
                </li>
            </ul>

            <!-- 面板 panes -->
            <div class="tab-content" style="margin-top: 30px">
                <div role="tabpanel" class="tab-pane active" id="blogs">
                    <div class="row" id="detailContainer">
                    </div>
                    <div class="row" style="margin-bottom: 20px">
                        <%--分页按钮--%>
                        <div class="col-lg-10 col-lg-offset-1 btn btn-info" id="btnMore" role="button">
                            加载更多
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="stars">
                    我的关注
                </div>
                <div role="tabpanel" class="tab-pane" id="category">
                    文章分类
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/date_fns.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/imgLiquid-min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/sweetalert.min.js"></script>
<script type="text/javascript">
    var blogsPageInfo;
    var detailContainer = $('#detailContainer');
    var btnLogin = $('#btnLogin');
    var dropdownMenu = $('#dropdownMenu');
    var btnStar = $('#btnStar');
    var btnMore = $('#btnMore');
    function deleteBlog(blogId) {
        console.log(blogId);
        sweetAlert(
            {
                title: "提示信息",
                text: "确定要删除?",
                type: "info",
                showCancelButton: true,
                cancelButtonText: "取消",
                confirmButtonText: "确定",
                closeOnConfirm: false,
                showLoaderOnConfirm: true
            }, function () {
                setTimeout(function () {

                    $.ajax({
                        type: 'post',
                        url: '<%=request.getContextPath()%>/delete/blog',
                        data: {
                            'blogId': blogId
                        },
                        async: false,
                        success: function (response) {
                            if (response["success"] === 1) {
                                swal({
                                        title: "提示信息",
                                        text: response["message"],
                                        type: "success"
                                    },
                                    function () {
                                        window.location.reload();
                                    });
                            } else {
                                swal("提示信息", "删除失败!", "error");
                            }
                        },
                        error: function (errorMessage) {
                            sweetAlert("出错啦!", errorMessage, "error");
                        }
                    });

                }, 2000);
            });
    }
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
        // ajax请求
        $.ajax({
            type: 'get',
            url: '<%=request.getContextPath()%>/blogs/createBy/${blogger.bloggerId}/pageNum/1/pageSize/2',
            async: false,
            success: function (pageInfo) {
                blogsPageInfo = pageInfo;
                console.log(blogsPageInfo["list"]);
                console.log(blogsPageInfo["hasNextPage"]);
                if (blogsPageInfo["hasNextPage"] === false) {
                    btnMore.addClass("disabled");
                }
                var blogDetailHtml = "";
                $.each(blogsPageInfo["list"], function (i, blogDetail) {
                    // 取信息
                    var blogId = blogDetail["blogId"];
                    var bloggerAvatar = blogDetail["bloggerAvatar"];
                    var bloggerName = blogDetail["bloggerName"];
                    var createAt = dateFns.format(new Date(blogDetail["createAt"]), "YYYY.MM.DD HH:mm:ss");
                    var blogTitle = blogDetail["blogTitle"];
                    var blogHtmlContent = blogDetail["blogHtmlContent"];
                    var regImageUrl = /(http|https):.*\.(png|jpeg|jpg|gif)/g;
                    var blogThum = blogDetail["blogThum"].match(regImageUrl)[0];
                    var blogHits = blogDetail["blogHits"];
                    var blogCollections = blogDetail["blogCollections"];
                    var blogComments = blogDetail["blogComments"];
                    var blogUrl = "<%=request.getContextPath()%>/showBlog/id/" + blogId;
                    var editBlogUrl = "<%=request.getContextPath()%>/edit/" + blogId;
                    blogDetailHtml +=
                        "<div class='col-lg-12'>" +
                        "<div class='row vertical-align'>" +
                        "<div class='col-lg-1'>" +
                        "<img class='img-circle' src='" + bloggerAvatar + "' alt='" + bloggerName + "' style='width: 50px;height: 50px;'>" +
                        "</div>" +
                        "<div class='col-lg-4'>" +
                        "<label class='label label-success'>" + bloggerName + "</label>" +
                        "<span class='text-muted' style='padding-left: 5px'>" + createAt + "</span>" +
                        "</div>" +
                        "<div class='col-lg-9 btn-toolbar' role='toolbar'>" +
                        "<div class='btn-group pull-right' role='group' >" +
                        "<a href='" + editBlogUrl + "' class='btn btn-default'><span class='glyphicon glyphicon-pencil'></span>" +
                        "</a>" +
                        "<a href='javascript:void(0);' class='btn btn-default' onclick='deleteBlog(" + blogId + ")'><span class='glyphicon glyphicon-trash'></span>" +
                        "</a>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "<div class='row vertical-align'>" +
                        "<div class='col-lg-12'>" +
                        "<div class='bs-callout'>" +
                        "<div class='row'>" +
                        "<div class='col-lg-9'>" +
                        "<a href='" + blogUrl + "' target='_blank'>" +
                        "<h4 class='titleContent'>" + blogTitle + "</h4>" +
                        "</a>" +
                        "<p class='iBlogContent'>" + blogHtmlContent + "</p>" +
                        "</div>" +
                        "<div class='col-lg-3 imgLiquidFill imgLiquid' style='width: 190px;height: 160px'>" +
                        "<a href='" + blogUrl + "' target='_blank'>" +
                        "<img class='img-thumbnail' src='" + blogThum + "'>" +
                        "</a>" +
                        "</div>" +
                        "</div>" +
                        "<div class='row'>" +
                        "<div class='col-lg-12'>" +
                        "<label class='label label-danger'>@程序员 @散文 @热点</label><span style='padding-left: 10px'></span>" +
                        "<a href='" + blogUrl + "' target='_blank'>" +
                        "<i class='fa fa-eye text-muted'>  " + blogHits + "</i><span style='padding-left: 10px'></span>" +
                        "</a>" +
                        "<i class='fa fa-bookmark-o text-muted'>  " + blogCollections + "</i><span style='padding-left: 10px'></span>" +
                        "<i class='fa fa-commenting-o text-muted'>  " + blogComments + "</i>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "<hr>" +
                        "</div>";
                });
                detailContainer.html(blogDetailHtml);
                // 初始化图片加载
                $(".imgLiquidFill").imgLiquid({
                    fill: true
                });
            },
            error: function (errorMessage) {
                console.log(errorMessage);
            }
        });

        // 获取更多按钮
        btnMore.bind('click', function () {
            // ajax请求
            $.ajax({
                type: 'get',
                url: "<%=request.getContextPath()%>/blogs/createBy/${blogger.bloggerId}/pageNum/" + blogsPageInfo["nextPage"] + "/pageSize/2",
                async: false,
                success: function (pageInfo) {
                    blogsPageInfo = pageInfo;
                    console.log(blogsPageInfo["list"]);
                    if (blogsPageInfo["hasNextPage"] === false) {
                        btnMore.addClass("disabled");
                    }
                    var blogDetailHtml = "";
                    $.each(blogsPageInfo["list"], function (i, blogDetail) {
                        // 取信息
                        var blogId = blogDetail["blogId"];
                        var bloggerAvatar = blogDetail["bloggerAvatar"];
                        var bloggerName = blogDetail["bloggerName"];
                        var createAt = dateFns.format(new Date(blogDetail["createAt"]), "YYYY.MM.DD HH:mm:ss");
                        var blogTitle = blogDetail["blogTitle"];
                        var blogHtmlContent = blogDetail["blogHtmlContent"];
                        var regImageUrl = /(http|https):.*\.(png|jpeg|jpg|gif)/g;
                        var blogThum = blogDetail["blogThum"].match(regImageUrl)[0];
                        var blogHits = blogDetail["blogHits"];
                        var blogCollections = blogDetail["blogCollections"];
                        var blogComments = blogDetail["blogComments"];
                        var blogUrl = "<%=request.getContextPath()%>/showBlog/id/" + blogId;
                        var editBlogUrl = "<%=request.getContextPath()%>/edit/" + blogId;
                        blogDetailHtml +=
                            "<div class='col-lg-12'>" +
                            "<div class='row vertical-align'>" +
                            "<div class='col-lg-1'>" +
                            "<img class='img-circle' src='" + bloggerAvatar + "' alt='" + bloggerName + "' style='width: 50px;height: 50px;'>" +
                            "</div>" +
                            "<div class='col-lg-4'>" +
                            "<label class='label label-success'>" + bloggerName + "</label>" +
                            "<span class='text-muted' style='padding-left: 5px'>" + createAt + "</span>" +
                            "</div>" +
                            "<div class='col-lg-9 btn-toolbar' role='toolbar'>" +
                            "<div class='btn-group pull-right' role='group' >" +
                            "<a href='" + editBlogUrl + "' class='btn btn-default'><span class='glyphicon glyphicon-pencil'></span>" +
                            "</a>" +
                            "<a href='javascript:void(0);' class='btn btn-default' onclick='deleteBlog(" + blogId + ")'><span class='glyphicon glyphicon-trash'></span>" +
                            "</a>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "<div class='row vertical-align'>" +
                            "<div class='col-lg-12'>" +
                            "<div class='bs-callout'>" +
                            "<div class='row'>" +
                            "<div class='col-lg-9'>" +
                            "<a href='" + blogUrl + "' target='_blank'>" +
                            "<h4 class='titleContent'>" + blogTitle + "</h4>" +
                            "</a>" +
                            "<p class='iBlogContent'>" + blogHtmlContent + "</p>" +
                            "</div>" +
                            "<div class='col-lg-3 imgLiquidFill imgLiquid' style='width: 190px;height: 160px'>" +
                            "<a href='" + blogUrl + "' target='_blank'>" +
                            "<img class='img-thumbnail' src='" + blogThum + "'>" +
                            "</a>" +
                            "</div>" +
                            "</div>" +
                            "<div class='row'>" +
                            "<div class='col-lg-12'>" +
                            "<label class='label label-danger'>@程序员 @散文 @热点</label><span style='padding-left: 10px'></span>" +
                            "<a href='" + blogUrl + "' target='_blank'>" +
                            "<i class='fa fa-eye text-muted'>  " + blogHits + "</i><span style='padding-left: 10px'></span>" +
                            "</a>" +
                            "<i class='fa fa-bookmark-o text-muted'>  " + blogCollections + "</i><span style='padding-left: 10px'></span>" +
                            "<i class='fa fa-commenting-o text-muted'>  " + blogComments + "</i>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "<hr>" +
                            "</div>";
                    });
                    detailContainer.append(blogDetailHtml);
                    // 初始化图片加载
                    $(".imgLiquidFill").imgLiquid({
                        fill: true
                    });
                },
                error: function (errorMessage) {
                    console.log(errorMessage);
                }
            });
        });
    });
</script>
</body>
</html>
