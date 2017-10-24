<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
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
    <script type="text/javascript">
        var app = angular.module('app', []);
        app.controller('MainController', function($rootScope, $scope, $http) {
            $scope.message = '';
            $scope.account = '';
            $scope.password = '';
            $scope.sex = "";
            $scope.mobile = "";
            $scope.email = "";
            //登录
            $scope.login = function() {
                $scope.message = '';
                $http(
                        {
                            url : '/addPerson',
                            method : 'POST',
                            headers : {
                                'Content-Type' : 'application/x-www-form-urlencoded'
                            },
                            data : 'username=' + $scope.account
                            + '&password=' + $scope.password
                            + "&sex=" + $scope.sex
                            + "&mobile=" + $scope.mobile
                            + "&email=" + $scope.email
                        }).success(function(r) {
                    if (!r.success) {
                        $scope.message = r.message;
                        return;
                    }
                    window.location.href = '/';
                });
            }
        });
    </script>
</head>
<body ng-app="app" ng-controller="MainController">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td class="tableleft">用户名</td>
        <td><input type="text" name="username" ng-model="account"/></td>
    </tr>
    <tr>
        <td class="tableleft">密码</td>
        <td><input type="password" name="password" ng-model="password"/></td>
    </tr>
    <tr>
        <td class="tableleft">性别</td>
        <td>
            <input type="radio" name="status" value="man" ng-model="sex"checked/> 男
            <input type="radio" name="status" value="women" ng-model="sex"/> 女
        </td>
    </tr>
    <tr>
        <td class="tableleft">电话号码</td>
        <td><input type="text" name="mobile" ng-model="mobile"/></td>
    </tr>
    <tr>
        <td class="tableleft">邮件</td>
        <td><input type="text" name="email" ng-model="email"/></td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="button" class="btn btn-primary" type="button" ng-click="login()">添加</button>
            &nbsp;&nbsp;
            <button type="button" class="btn btn-success" onclick="window.location.href='/'">返回列表</button>
        </td>
    </tr>
    <tr>
        <td>
            <font color="red" ng-show="message">{{message}}</font>
        </td>
    </tr>
</table>
</body>
</html>
