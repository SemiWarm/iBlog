<%--
  Created by IntelliJ IDEA.
  User: alibct
  Date: 2017/4/21
  Time: 下午4:54
  Desc: 博主管理
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>博主管理</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap-table.min.css">
    <style>
        body {
            padding-top: 20px;
        }

        .paddingTop {
            padding-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- 导航 -->
    <div class="row">
        <div class="col-lg-12">
            <ul class="nav nav-tabs">
                <li role="presentation"><a href="<%=request.getContextPath()%>/admin">主页</a></li>
                <li role="presentation" class="active"><a href="<%=request.getContextPath()%>/blogger">博主管理</a></li>
                <li role="presentation"><a href="<%=request.getContextPath()%>/blog">博文管理</a></li>
            </ul>
        </div>
    </div>
    <!-- 添加博主 -->
    <div class="row">

        <div class="col-lg-12 paddingTop">
            <!-- 工具栏 -->
            <div class="row" id="toolBar">

                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="">
                                <span class="input-group-btn"><button class="btn btn-default" type="button"><span
                                        class="glyphicon glyphicon-search"></span></button></span>
                            </div>
                        </div>

                        <div class="col-lg-6">

                        </div>

                        <div class="col-lg-3">
                            <div class="btn-toolbar pull-right" role="toolbar" aria-label="...">
                                <div class="btn-group" role="group" aria-label="...">
                                    <button class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span>
                                    </button>
                                    <button class="btn btn-default"><span class="glyphicon glyphicon-trash"></span>
                                    </button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
            <!-- 表格 -->
            <div class="row">

                <div class="col-lg-12">

                    <div class="col-lg-12">
                        <table id="bloggerTable"
                               data-toggle="table"
                               data-toolbar="#toolBar"
                               data-click-to-select="true"
                               data-url="<%=request.getContextPath()%>/bloggers"
                               data-pagination="true"
                               data-side-pagination="client"
                               data-page-size="2"
                               data-page-list="[2,5,10]">
                            <thead>
                            <tr>
                                <th rowspan="2" data-field="state" data-radio="true" data-halign="center"
                                    data-align="center"
                                    data-valign="middle">#
                                </th>
                                <th rowspan="2" data-field="bloggerId" data-halign="center" data-align="center"
                                    data-valign="middle">博主ID
                                </th>
                                <th colspan="5" data-halign="center" data-align="center" data-valign="middle">博主信息</th>
                            </tr>
                            <tr>
                                <th data-field="bloggerName" data-halign="center" data-align="center"
                                    data-valign="middle">
                                    博主昵称
                                </th>
                                <th data-field="bloggerAccount" data-halign="center" data-align="center"
                                    data-valign="middle">
                                    博主账号
                                </th>
                                <th data-field="bloggerProfile" data-halign="center" data-align="center"
                                    data-valign="middle">
                                    博主简介
                                </th>
                                <th data-field="bloggerAvatar" data-halign="center" data-align="center"
                                    data-valign="middle">
                                    博主头像
                                </th>
                                <th data-field="status" data-halign="center" data-align="center" data-valign="middle">
                                    博主状态
                                </th>
                            </tr>
                            </thead>
                        </table>

                        <!-- Modal -->
                        <div class="modal fade" id="imagePreviewModal" tabindex="-1" role="dialog"
                             aria-labelledby="imagePreviewModalLabel">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close"><span
                                                aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">图片预览</h4>
                                    </div>
                                    <div class="modal-body text-center">
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-default" type="button" data-dismiss="modal">
                                            取消
                                        </button>
                                        <button class="btn btn-primary" type="button" data-dismiss="modal">
                                            确定
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>

<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap-table.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript">
    var bloggerTable = $('#bloggerTable');

    $('#imagePreviewModal').on('show.bs.modal', function (e) {
        // 获取启动模态框的对象
        var bloggerAvatarUrl = $(e.relatedTarget);
        // 获取预览图片按钮的value值
        $('.modal-body').html("<img src='" + bloggerAvatarUrl.val() + "' alt=''>");
    });
</script>
</body>
</html>
