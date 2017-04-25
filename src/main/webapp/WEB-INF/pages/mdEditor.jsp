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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Markdown 编辑器</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/editormd.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/sweetalert.css"/>
    <style>
        body {
            padding-top: 50px;
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
                                    <li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;我的主页</a>
                                    </li>
                                    <li><a href="#"><span class="glyphicon glyphicon-bookmark"></span>&nbsp;&nbsp;收藏的文章</a>
                                    </li>
                                    <li><a href="#"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;喜欢的文章</a>
                                    </li>
                                    <li><a href="#"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;退出</a>
                                    </li>
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
</div>
<!-- 编辑器 -->
<div id="container">
    <div id="mdEditor">
        <textarea class="editormd-markdown-textarea" name="markdown-area"
                  style="display:none;"># 请输入标题</textarea>
        <textarea class="editormd-html-textarea" name="html-area"></textarea>
    </div>
</div>
<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/editormd.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/sweetalert.min.js"></script>
<script type="text/javascript">

    var blogTitle;
    var blogMarkdownContent;
    var blogHtmlContent;
    var blogThum;
    var wordCount;
    var createBy;

    var editor;
    $(function () {
        editor = editormd("mdEditor", {
            width: "90%",
            height: 634,
            //syncScrolling: false,
            path: "<%=request.getContextPath()%>/static/lib/",
            saveHTMLToTextarea: true,
            emoji: true,
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL: "<%=request.getContextPath()%>/upload/editormd/images",
            onfullscreen: function () {
                // 解决编辑器工具栏被导航条挡住的问题
                //$('.editormd-fullscreen').css('position', 'relative');
                $('#iBlogNav').css('display', 'none');
            },
            onfullscreenExit: function () {
                //$('.editormd-fullscreen').css("position", '');
                $('#iBlogNav').css('display', 'block');
            }
        });
        // 获取博文作者
        createBy = <%=bloggerId%>;
    });

    $("#btnSavaBlog").bind('click', function () {
        // 获取 Markdown 源码
        var markdownText = editor.getMarkdown();
        // 获取markdown文本所有图片的正则表达式
        var regImages = /!\[.*\]\((http|https):\/\/.*(.jpg|.jpeg|.png|.gif|.bmp|.webp)\)/g;
        // 不完全字数统计
        var regWords = /\b\w+\b|[\u4e00-\u9fa5]/g;

        if (markdownText === '# 请输入标题' || markdownText === '') { // 没有填写任何信息
            sweetAlert("出错啦!", "请输入博文内容!", "error");
        } else {
            // 赋值操作
            // 1.获取标题
            blogTitle = markdownText.split('\n')[0];
            // 2.获取Markdown博文内容
            blogMarkdownContent = markdownText.substring(blogTitle.length, markdownText.length);
            // 3.获取Html博文内容
            blogHtmlContent = editor.getHTML();
            // 4.获取内容的第一张图片作为缩略图
            blogThum = markdownText.match(regImages);
            if (blogThum !== null){
                blogThum = markdownText.match(regImages)[0];
            } else {
                blogThum = "http://localhost:8080/images/thum.png";
            }
            // 5.获取不完全字数统计
            wordCount = blogMarkdownContent.match(regWords).length;

            doAddBlog();
        }

    });

    var doAddBlog = function () {

        swal({
                title: "提示信息",
                text: "确定保存已完成的博文?",
                type: "info",
                showCancelButton: true,
                cancelButtonText: "取消",
                confirmButtonText: "确定",
                closeOnConfirm: false,
                showLoaderOnConfirm: true
            },
            function () {

                setTimeout(function () {

                    $.ajax({
                        // 请求发送方式
                        type: 'post',
                        // 请求地址
                        url: '<%=request.getContextPath()%>/blogs',
                        // 请求数据，用户名和密码
                        data: {
                            'blogTitle': blogTitle,
                            'blogMarkdownContent': blogMarkdownContent,
                            'blogHtmlContent': blogHtmlContent,
                            'blogThum': blogThum,
                            'wordCount': wordCount,
                            'createBy': createBy
                        },
                        // 异步，不写默认为True
                        async: false,
                        success: function (addBlogResponse) {
                            if (addBlogResponse["success"] === 1) {
                                editor.clear(); // 清空
                                editor.setMarkdown("# 请输入标题");
                                swal({
                                        title: "提示信息",
                                        text: "恭喜您!博文已保存是否查看?",
                                        type: "success",
                                        showCancelButton: true,
                                        cancelButtonText: "取消",
                                        confirmButtonText: "确定",
                                        closeOnConfirm: false,
                                        closeOnCancel: true
                                    },
                                    function (isConfirm) {
                                        if (isConfirm) {
                                            // 打开查看文章的界面
                                            window.location.href = "<%=request.getContextPath()%>/showBlog/id/" + addBlogResponse["data"]["blogId"];
                                        } else {
                                            editor.clear(); // 清空
                                            editor.setMarkdown("# 请输入标题");
                                        }
                                    });
                            } else {
                                swal("提示信息", "好气啊!博文保存失败!", "error");
                            }
                        },
                        error: function (errorMessage) {
                            sweetAlert("出错啦!", errorMessage, "error");
                        }
                    });

                }, 2000);
            });
    };
</script>
</body>
</html>
