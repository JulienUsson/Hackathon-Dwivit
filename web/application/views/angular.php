<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html ng-app="Dwivit" lang="fr">
	<head>
		<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Dwivit</title>
		<link href="./assets/css/bootstrap.min.css" rel="stylesheet">
		<link href="./assets/css/bootstrap-theme.min.css" rel="stylesheet">
		<script src="./assets/lib/angular.min.js"></script>
		<script src="./assets/lib/angular-route.min.js"></script>
		<script src="./assets/lib/ui-bootstrap.min.js"></script>
		<script src="./assets/lib/Chart.min.js"></script>
		<script src="./assets/lib/angular-chart.js"></script>
		<script src="./assets/js/app.js"></script>
	</head>
	<body>
		<div ng-controller="alerteController">
		  <uib-alert ng-repeat="alerte in alertes" type="{{alerte.type}}" close="closeAlert($index)">{{alerte.message}}</uib-alert>
		</div>
		<div ng-view></div>
	</body>
</html>
