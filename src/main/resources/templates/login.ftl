<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Welcome To Admin System</title>
	<script type="text/javascript" src="../static/Js/angular.min.js"></script>
	<style>
		body {
			padding-top: 40px;
			padding-bottom: 40px;
			background-color: #b9b0e5;
		}
		.table-signin {
			max-width: 300px;
			padding: 19px 29px 29px;
			margin: 0 auto 20px;
			background-color: #fff;
			border: 1px solid #e5e5e5;
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
			-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
			box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
		}
		.form-signin input[type="text"],
		.form-signin input[type="password"]
		.form-signin input[type="button"]{
			font-size: 16px;
			height: auto;
			margin-bottom: 15px;
			padding: 7px 9px;
		}
	</style>
<script type="text/javascript">
	var app = angular.module('app', []);
	app.controller('MainController', function($rootScope, $scope, $http) {
		$scope.message = '';
		$scope.account = '';
		$scope.password = '';
		//登录
		$scope.login = function() {
			$scope.message = '';
			$http(
					{
						url : '/loginPost',
						method : 'POST',
						headers : {
							'Content-Type' : 'application/x-www-form-urlencoded'
						},
						data : 'account=' + $scope.account
							+ '&password=' + $scope.password
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
	<h1 style="text-align: center">Welcome To Admin System</h1>

	<table class="table-signin" cellspacing="1" style="background-color: #a0c6e5">
		<tr>
			<td>账号：</td>
			<td><input type="text" ng-model="account" /></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><input type="password" ng-model="password" /></td>
		</tr>
		<tr>
			<td><input type="button" value="登录" ng-click="login()" /></td>
			<td><font color="red" ng-show="message">{{message}}</font></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="无登陆查看信息" onclick="window.location.href='/show'">
			</td>
		</tr>
	</table>

</body>
</html>