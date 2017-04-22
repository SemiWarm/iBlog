<%--
  Created by IntelliJ IDEA.
  User: alibct
  Date: 2017/4/22
  Time: 下午4:10
  Desc: 主页登录
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String blogger = (String) session.getAttribute("bloggerName");
    if (null != blogger && blogger.length() > 0) {
        response.sendRedirect(request.getContextPath() + "/main");
    }
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>主页登录</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/sweetalert.css">
    <style>
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #fff;
        }

        .vertical-align {
            display: flex;
            align-items: center;
        }

        .logo {
            margin: 0 auto;
            width: 160px;
            height: 90px;
            background: url("<%=request.getContextPath()%>/static/images/iBlog.png") no-repeat;
            background-size: contain;
        }

        .hide-text {
            font: 0/0 a;
            color: transparent;
            text-shadow: none;
            border: 0;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }

        .form-signin .form-signin-heading,
        .form-signin {
            margin-bottom: 10px;
        }

        .form-signin {
            font-weight: normal;
        }

        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }

        .form-signin .form-control:focus {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

    </style>
</head>
<body>

<div class="container">

    <div class="row vertical-align">
        <div class="col-lg-12">
            <form class="form-signin">
                <h2 class="form-signin-heading logo hide-text">iBlog</h2>
                <!-- 账号 -->
                <label for="bloggerAccount" class="sr-only">Email address</label>
                <input type="email" id="bloggerAccount" name="bloggerAccount" class="form-control" placeholder="邮箱"
                       required>
                <!-- 密码 -->
                <label for="loginPassword" class="sr-only">Password</label>
                <input type="password" id="loginPassword" name="loginPassword" class="form-control" placeholder="密码"
                       required>
                <!-- 注册和登录按钮 -->
                <div class="row">
                    <div class="col-lg-5 pull-left">
                        <button class="btn btn-lg btn-warning btn-block" type="button">注册</button>
                    </div>
                    <div class="col-lg-5 pull-right">
                        <button class="btn btn-lg btn-primary btn-block" type="button" id="btnSignIn" name="btnSignIn">
                            登录
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>

<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/sweetalert.min.js"></script>
<script type="text/javascript">
    var bloggerAccount = $('#bloggerAccount');
    var loginPassword = $('#loginPassword');
    var btnSignIn = $('#btnSignIn');

    $(function () {
        btnSignIn.bind('click', function () {
            if (checkInput().length > 0) {
                sweetAlert("出错啦!", checkInput(), "error");
            } else {
                doLogin();
            }
        });
    });

    var doLogin = function () {
        btnSignIn.text("登录中...");
        btnSignIn.attr("disabled", true);
        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath()%>/signIn',
            data: {'bloggerAccount': bloggerAccount.val(), 'loginPassword': loginPassword.val()},
            async: true,
            success: function (signInResponse) {
                if (signInResponse["success"] === 1) {
                    window.location.href = "<%=request.getContextPath()%>/main";
                } else {
                    sweetAlert("出错啦!", signInResponse["message"], "error");
                    btnSignIn.text("登录");
                    btnSignIn.attr("disabled", false);
                }
            },
            error: function (errorMessage) {
                sweetAlert("出错啦!", errorMessage, "error");
                btnSignIn.text("登录");
                btnSignIn.attr("disabled", false);
            }
        });
    };

    var checkInput = function () {
        var resultInfo = "";
        if (IsNull(replaceHTML(bloggerAccount.val()))) {
            resultInfo += "请输入登录账号!\n";
        }
        if (IsNull(replaceHTML(loginPassword.val()))) {
            resultInfo += "请输入登录密码!\n";
        }
        return resultInfo;
    };

    /**
     * 判断字符串是否为空
     * @return {boolean}
     */
    function IsNull(str) {
        return (Trim(str) === "");
    }
    function Trim(str) {
        return str.replace(/(^\s*)|(\s*$)/g, "");
    }
    function replaceHTML(str) {
        str = str.replace(/<[^>].*?>/g, "");
        str = str.replace(/&nbsp;/g, "");
        return str;
    }
</script>
</body>
</html>
