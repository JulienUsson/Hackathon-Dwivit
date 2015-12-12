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
		<link href="./assets/css/style.css" rel="stylesheet">
		<script src="./assets/lib/angular.min.js"></script>
		<script src="./assets/lib/angular-route.min.js"></script>
		<script src="./assets/lib/angular-animate.min.js"></script>
		<script src="./assets/lib/ui-bootstrap.min.js"></script>
		<script src="./assets/lib/Chart.min.js"></script>
		<script src="./assets/lib/angular-chart.js"></script>
		<script src="./assets/js/app.js"></script>
	</head>
	<body>
		<nav ng-controller="menuController" class="navbar navbar-default navbar-fixed-top">
		  <div class="container-fluid">

		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" ng-click="isOpen = !isOpen">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#">Dwivit</a>
		    </div>

		    <div class="collapse navbar-collapse" uib-collapse="!isOpen">
		      <ul class="nav navbar-nav">
		        <li><a href="#">Forfaits</a></li>
		        <li><a href="#">Services</a></li>
		        <li><a href="#">Réseau</a></li>
		      </ul>
		      <form class="navbar-form navbar-right" role="search">
		        <div class="form-group">
		          <input type="text" class="form-control" placeholder="E-mail">
		        </div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="Mot de passe">
						</div>
		        <button type="submit" class="btn btn-default">Connexion</button>
		      </form>
		    </div>

		  </div>
		</nav>

		<div class="container-fluid">
			<div class="row">
				<div class="alertes" ng-controller="alerteController">
					<uib-alert ng-repeat="alerte in alertes" type="{{alerte.type}}" close="closeAlert($index)">{{alerte.message}}</uib-alert>
				</div>
			</div>
			<div class="row">
				<div ng-view></div>
			</div>
		</div>

	</body>
</html>
