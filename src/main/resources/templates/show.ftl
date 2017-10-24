<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="../static/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../static/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../static/Css/style.css" />
    <script type="text/javascript" src="../static/Js/jquery.js"></script>
    <script type="text/javascript" src="../static/Js/bootstrap.js"></script>
    <script type="text/javascript" src="../static/Js/ckform.js"></script>
    <script type="text/javascript" src="../static/Js/common.js"></script>
    <script type="text/javascript" src="../static/Js/angular.min.js"></script>
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }
        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
    </style>
</head>
<body>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <td>
            <button style="float: left" type="button" class="btn btn-primary"
                    onclick="window.location.href='/add'" id="add" disabled="disabled">新增角色</button>
            <button style="float: left" type="button" class="btn btn-primary"
                    onclick="window.location.href='/login'">返回登陆界面</button>
        </td>
    </tr>
    <tr>
        <th>用户id</th>
        <th>用户头像</th>
        <th>用户名</th>
        <th>用户密码</th>
        <th>性别</th>
        <th>手机号</th>
        <th>邮箱</th>
        <th>状态码</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#if person??>
        <#list person as user>
        <tr>
            <td style="width: 200px">${user.id!}</td>
            <td>
                <img src="../static/img/${user.sex!}.jpg" class="img-circle" style="height: 70px; width: 70px">
            </td>
            <td>${user.username!}</td>
            <td>Unknow</td>
            <td>${user.sex!}</td>
            <td>${user.mobile!}</td>
            <td>${user.email!}</td>
            <td>${user.status!}</td>
            <td>
                <button id = "${user.id!}" class="btn btn-primary"ng-click="edit(${user.id})" disabled="disabled">编辑</button>
                <button id = "${user.username!}" class="btn btn-success" ng-click="delete(${user.id})" disabled="disabled">删除</button>
            </td>
        </tr>
        </#list>
    </#if>
    </tbody>
</table>
</body>
</html>