<%--
  Created by IntelliJ IDEA.
  User: alibct
  Date: 2017/4/22
  Time: 下午4:10
  Desc: 注册界面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>主页注册</title>
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
            text-align: center;
        }

        .form-signin input[type="text"] {
            margin-bottom: -1px;
            border-radius: 0;
            text-align: center;
        }

        .form-signin input[id="loginPassword"] {
            margin-bottom: -1px;
            border-radius: 0;
            text-align: center;
        }

        .form-signin input[id="confirmLoginPassword"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
            text-align: center;
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
                <input type="email" id="bloggerAccount" name="bloggerAccount" class="form-control"
                       placeholder="邮箱:xxx@iBlog.com"
                       required autofocus>
                <!-- 昵称 -->
                <label for="bloggerName" class="sr-only">Name</label>
                <input type="text" id="bloggerName" name="bloggerName" class="form-control" placeholder="昵称"
                       required>
                <!-- 密码 -->
                <label for="loginPassword" class="sr-only">Password</label>
                <input type="password" id="loginPassword" name="loginPassword" class="form-control" placeholder="密码"
                       required>
                <!-- 确认密码 -->
                <label for="confirmLoginPassword" class="sr-only">Password</label>
                <input type="password" id="confirmLoginPassword" name="confirmLoginPassword" class="form-control"
                       placeholder="确认密码"
                       required>
                <!-- 注册按钮 -->
                <button class="btn btn-lg btn-warning btn-block" type="button" id="btnSignUp">注册</button>
            </form>
        </div>
    </div>

</div>

<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/sweetalert.min.js"></script>
<script type="text/javascript">

    var bloggerAccount = $('#bloggerAccount');
    var bloggerName = $('#bloggerName');
    var loginPassword = $('#loginPassword');
    var confirmLoginPassword = $('#confirmLoginPassword');
    var btnSignUp = $('#btnSignUp');

    $(function () {
        btnSignUp.bind('click', function () {
            if (checkInput().length > 0) {
                sweetAlert("出错啦!", checkInput(), "error");
            } else {

                if (loginPassword.val() === confirmLoginPassword.val()) {
                    doSignUp();
                } else {
                    sweetAlert("出错啦!", "两次密码不一致!请重新输入!", "error");
                    // 清空密码域
                    loginPassword.val("");
                    confirmLoginPassword.val("");
                }
            }
        });
    });

    var doSignUp = function () {
        btnSignUp.text("注册中...");
        btnSignUp.attr("disabled", true);
        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath()%>/bloggers',
            data: {
                'bloggerAccount': bloggerAccount.val(),
                'bloggerName': bloggerName.val(),
                'loginPassword': loginPassword.val()
            },
            async: true,
            success: function (signUpResponse) {
                if (signUpResponse["success"] === 1) {
                    sweetAlert({
                            title: "恭喜您!",
                            text: signUpResponse["message"] + "\n是否前往登录?",
                            type: "success"
                        },
                        function () {
                            // 需要让用户确定之后登录
                            window.location.href = "<%=request.getContextPath()%>/";
                        });
                } else {
                    sweetAlert("出错啦!", signUpResponse["message"], "error");
                    btnSignUp.text("注册");
                    btnSignUp.attr("disabled", false);
                }
            },
            error: function (errorMessage) {
                sweetAlert("出错啦!", errorMessage, "error");
                btnSignUp.text("注册");
                btnSignUp.attr("disabled", false);
            }
        });
    };

    var checkInput = function () {
        var resultInfo = "";
        if (IsNull(replaceHTML(bloggerAccount.val()))) {
            resultInfo += "请输入登录账号!\n";
        } else {
            var regEmail = /^[a-zA-Z0-9]+\@iBlog\.(com|net|cn)$/;
            if (!regEmail.test(bloggerAccount.val())) {
                resultInfo += "请输入符合条件的邮箱!例如:xxx@iBlog.com";
            }
        }
        if (IsNull(replaceHTML(bloggerName.val()))) {
            resultInfo += "请输入博主昵称!\n";
        }
        if (IsNull(replaceHTML(loginPassword.val()))) {
            resultInfo += "请输入登录密码!\n";
        }
        if (IsNull(replaceHTML(confirmLoginPassword.val()))) {
            resultInfo += "请确认登录密码!\n";
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
