<%--
  Created by IntelliJ IDEA.
  User: alibct
  Date: 2017/4/21
  Time: 下午4:54
  Desc: 博文管理
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>博文管理</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/sweetalert.css">
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
                <li role="presentation"><a href="<%=request.getContextPath()%>/admin">主页</a></li>
                <li role="presentation"><a href="<%=request.getContextPath()%>/blogger">博主管理</a></li>
                <li role="presentation" class="active"><a href="<%=request.getContextPath()%>/blog">博文管理</a></li>
            </ul>
        </div>
    </div>

    <div class="row">

        <div class="col-lg-12 paddingTop">
            <!-- 工具栏 -->
            <div class="row" id="toolBar">

                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="input-group">
                                <input type="text" id="searchText" class="form-control" placeholder="按标题模糊查询">
                                <span class="input-group-btn"><button id="btnSearch" class="btn btn-default"
                                                                      type="button"><span
                                        class="glyphicon glyphicon-search"></span></button></span>
                            </div>
                        </div>

                        <div class="col-lg-6">

                        </div>

                        <div class="col-lg-3">
                            <div class="btn-toolbar pull-right" role="toolbar" aria-label="...">
                                <div class="btn-group" role="group" aria-label="...">
                                    <button id="btnDelete" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span>
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
                        <table id="blogDetailTable"
                               data-toggle="table"
                               data-toolbar="#toolBar"
                               data-click-to-select="true"
                               data-url="<%=request.getContextPath()%>/blogDetails"
                               data-pagination="true"
                               data-side-pagination="client"
                               data-page-size="5"
                               data-page-list="[10,20]">
                            <thead>
                            <tr>
                                <th rowspan="2" data-field="state" data-radio="true" data-halign="center"
                                    data-align="center"
                                    data-valign="middle">#
                                </th>
                                <th rowspan="2" data-field="blogId" data-halign="center" data-align="center"
                                    data-valign="middle">博客ID
                                </th>
                                <th colspan="4" data-halign="center" data-align="center" data-valign="middle">博客信息</th>
                            </tr>
                            <tr>
                                <th data-field="blogTitle" data-halign="center" data-align="center"
                                    data-valign="middle">
                                    博文标题
                                </th>
                                <th data-field="blogHits" data-halign="center" data-align="center"
                                    data-valign="middle">
                                    博文点击量
                                </th>
                                <th data-field="blogComments" data-halign="center" data-align="center"
                                    data-valign="middle">
                                    博文评论量
                                </th>
                                <th data-field="bloggerName" data-halign="center" data-align="center"
                                    data-valign="middle">
                                    博主名称
                                </th>
                            </tr>
                            </thead>
                        </table>

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
<script src="<%=request.getContextPath()%>/static/js/sweetalert.min.js"></script>
<script type="text/javascript">
    var blogDetailTable = $('#blogDetailTable');
    var btnSearch = $('#btnSearch');
    var searchText = $('#searchText');
    var btnDelete = $('#btnDelete');
    btnSearch.bind('click', function () {
        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath()%>/searchBlogDetails',
            data: {"searchText": searchText.val()},
            async: true,
            success: function (response) {
                console.log(response);
                blogDetailTable.bootstrapTable('load', response);
            },
            error: function (errorMessage) {
                console.log(errorMessage);
            }
        });
    });

    btnDelete.bind('click', function () {
        var selectedRow = blogDetailTable.bootstrapTable('getSelections');
        var blogId = selectedRow[0]["blogId"];
        console.log(blogId);
        sweetAlert({
            title: "提示信息",
            text: "确定要删除该博文吗?删除后不可恢复哦!",
            type: "info",
            showCancelButton: true,
            cancelButtonText: "取消",
            confirmButtonText: "确定",
            closeOnConfirm: false,
            closeOnCancel: true
        }, function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    type: 'post',
                    url: '<%=request.getContextPath()%>/delete/blog',
                    data: {"blogId": blogId},
                    success: function (response) {
                        if (response["success"] === 1) {
                            swal({title: "提示信息", text: response["message"], type: "success"}, function () {
                                blogDetailTable.bootstrapTable('refresh');
                            });
                        }
                    },
                    error: function (errorMessage) {
                        console.log(errorMessage);
                    }
                });
            } else {
            }
        });
    });
</script>
</body>
</html>
