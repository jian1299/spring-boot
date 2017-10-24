<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="../static/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../static/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../static/Css/style.css" />
    <script type="text/javascript" src="../static/Js/jquery.js"></script>
    <script type="text/javascript" src="../static/Js/jquery.sorted.js"></script>
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
    <script type="text/javascript">
        var app = angular.module('app', []);
        app.controller('MainController', function($rootScope, $scope, $http) {

            //修改
            $scope.edit = function(id) {
                $.post("/updatePerson/"+id,function (res) {
                    $("#id").val(res.id);
                    $("#username").val(res.username);
                    $("#password").val(res.password);
                    $("input[name='sex'][value="+res.sex+"]").attr("checked",true);
                    $("#mobile").val(res.mobile);
                    $("#email").val(res.email);
                });
                $("#templateModal").modal();
            };
            $scope.delete = function(id) {
                $.post("/delete/"+id,function () {
                    location.reload();
                });
            };
            $("#saveBtn").click(function() {
                var formData=new FormData($('#templateForm')[0]);
                $.ajax({
                    url:"/update",
                    type:"post",
                    data:formData,
                    async:false,
                    cache:false,
                    contentType: false,
                    processData: false,
                    success:function(){
                        location.reload();
                    }
                });
            });
        });

    </script>
</head>
<body ng-app="app" ng-controller="MainController">

<div  class="dl-log" style="float:right">欢迎您，
    <span class="dl-log-user">${name}</span>
    <a href="/logout">注销</a>
</div>
<br/><br/><br/>
<div>

</div>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <td>
            <button style="float: left" type="button" class="btn btn-primary"
                    onclick="window.location.href='/add'" id="add">新增角色</button>
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
            <td>${user.id!}</td>
            <td>
                <img src="../static/img/${user.sex!}.jpg" style="height: 70px; width: 70px">
            </td>
            <td>${user.username!}</td>
            <td>${user.password!}</td>
            <td>${user.sex!}</td>
            <td>${user.mobile!}</td>
            <td>${user.email!}</td>
            <td>${user.status!}</td>
            <td>
                <button id = "${user.id!}" class="btn btn-primary"ng-click="edit(${user.id})">编辑</button>
                <button id = "${user.username!}" class="btn btn-success" ng-click="delete(${user.id})">删除</button>
            </td>
        </tr>
        </#list>
    </#if>
    </tbody>
</table>
<div class="modal fade" id="templateModal" tabindex="-1" aria-labelledby="templateModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title text-primary" id="updateModalLabel">Update Person</h4>
            </div>
            <div class="modal-body">
                <form id="templateForm" class="form-inline" enctype="multipart/form-data">

                    <div class="form-group" id="idGlass">
                        <label>用户ID</label>
                        <input type="text" class="form-control" id="id" name="id" placeholder="System Default" readonly>
                    </div>
                    <div class="form-group">
                        <label>姓名</label>
                        <input type="text" class="form-control" id="username" name="username">
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input type="password" class="form-control" id="password" name="password">
                    </div>
                    <div class="form-group">
                        <label>性别</label>
                        <label class="radio-inline">
                            <input type="radio" name="sex" id="sexRadio1" value="man"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="sex" id="sexRadio2" value="women"> 女
                        </label>
                    </div>
                    <div class="form-group">
                        <label>电话号码</label>
                        <input type="text" class="form-control" id="mobile" name="mobile">
                    </div>
                    <div class="form-group">
                        <label>邮箱</label>
                        <input type="email" class="form-control" id="email" name="email">
                    </div>
                    <br><br>
                </form>
            </div>
            <div class="modal-footer">
                <button id="saveBtn" type="button" class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>