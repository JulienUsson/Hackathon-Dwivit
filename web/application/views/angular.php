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
		<nav ng-controller="menuController" class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">

		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" ng-click="isOpen = !isOpen">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a ng-hide="loggedIn" class="navbar-brand" ng-click="scrollTo('top')" href="">DWIV<span class="jaune">IT</span></a>
					<a ng-show="loggedIn" class="navbar-brand" href="/#/compte/">DWIV<span class="jaune">IT</span></a>
		    </div>

				<div ng-hide="loggedIn">
			    <div class="collapse navbar-collapse" uib-collapse="!isOpen">
			      <ul class="nav navbar-nav">
			        <li><a ng-click="scrollTo('forfaits')" href="">Forfaits</a></li>
			        <li><a ng-click="scrollTo('services')" href="">Services</a></li>
			        <li><a ng-click="scrollTo('reseau')" href="">Réseau</a></li>
			      </ul>
			      <form ng-submit="login()" class="navbar-form navbar-right" role="search">
			        <div class="form-group">
			          <input type="text" class="form-control" placeholder="E-mail">
			        </div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="Mot de passe">
							</div>
			        <button type="submit" class="btn btn-success">Connexion</button>
			      </form>
			    </div>
				</div>

				<div ng-show="loggedIn">
					<div class="collapse navbar-collapse" uib-collapse="!isOpen">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/#/compte/reparation/">Réparations</a></li>
							<li><a href="/#/compte/consommation/">Consommation</a></li>
							<li><a href="/#/compte/statistique/">Stastiques</a></li>
							<li><a ng-click="logout()" href="">Déconnexion</a></li>
						</ul>
					</div>
				</div>

		  </div>
		</nav>

		<div class="container-fluid">
			<div ng-show="loggedIn" class="row padding">
				<div class="alertes" ng-controller="alerteController">
					<uib-alert ng-repeat="alerte in alertes" type="{{alerte.type}}" close="closeAlert($index)">{{alerte.message}}</uib-alert>
				</div>
			</div>
			<div>
				<div ng-view></div>
			</div>
		</div>

	</body>
</html>
