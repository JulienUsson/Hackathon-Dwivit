var app = angular.module('Dwivit', ['ngRoute', 'ngAnimate', 'ui.bootstrap', 'chart.js']);

app.config(function($routeProvider) {
	$routeProvider.
    when('/', {
			templateUrl : './assets/templates/home.html',
			controller  : 'homeController'
    }).
		when('/compte', {
			templateUrl : './assets/templates/gestion.html',
			controller  : 'gestionController'
		}).
		when('/compte/reparation', {
			templateUrl : './assets/templates/reparation.html',
			controller  : 'reparationController'
		}).
		when('/compte/consommation', {
			templateUrl : './assets/templates/consommation.html',
			controller  : 'consommationController'
		}).
		when('/compte/statistique', {
			templateUrl : './assets/templates/statistique.html',
			controller  : 'statistiqueController'
		}).
    otherwise({
			redirectTo: '/'
		});
});

app.run(function($rootScope) {
    $rootScope.loggedIn=false;
});

app.controller('homeController', function($rootScope, $scope, $http, $sce) {
	$scope.slides=[
		{image: "assets/img/slide1.jpg", titre: $sce.trustAsHtml('Un forfait <span class="jaune">tout compris</span>'), texte: "Vos révision, le remplacement des pièces d'usures et l'assistance sont inclus."},
		{image: "assets/img/slide2.jpg", titre: $sce.trustAsHtml('Une solution <span class="jaune">simple</span>'), texte: "Vous adaptez votre forfait à votre véhicule."},
		{image: "assets/img/slide3.jpg", titre: $sce.trustAsHtml('Pas de mauvaise <span class="jaune">surprise</span>'), texte: "Votre véhicule toujout prêt à rouler, en tout sécurité."}
	];
});

app.controller('menuController', function($rootScope, $scope, $http, $location, $anchorScroll, $window) {
	$scope.login = function() {
		$rootScope.loggedIn=true;
		$location.url('/compte');
	};

	$scope.logout = function() {
		$rootScope.loggedIn=false;
		$location.url('/');
	};

	$scope.scrollTo = function(anchor) {
		if(anchor=="top") {
			$window.scrollTo(0,0);
		}
		else {
			$location.hash(anchor);
			$anchorScroll.yOffset = 50;
			$anchorScroll();
		}
	}
});

app.controller('gestionController', function($scope, $http) {

});

app.controller('alerteController', function($rootScope, $scope) {
		$scope.alertes=[
			{ type: 'danger', message: 'Une révision est nécessaire avant la fin du mois.' },
			{ type: 'warning', message: 'Pensez a faire vérifier vos pneus !' }
		];

	$scope.closeAlert = function(index) {
		$scope.alertes.splice(index, 1);
	};
});

app.controller('reparationController', function($scope, $http) {
	$scope.reparations=[];
	$http.get("./api/voitures/1/reparations").success(function(data){
		$scope.reparations=data;
	});
});

app.controller('statistiqueController', function($scope, $http) {
	$scope.reparations=[];
	$http.get("./api/voitures/1/reparations").success(function(data){
		$scope.reparations=data;
	});

	$scope.consommations=[];
	$http.get("./api/voitures/1/consommations").success(function(data){
		$scope.consommations=data;
	});
});


app.controller('consommationController', function($scope, $http) {
	$scope.form=[];
	$scope.form.date = new Date();
	$scope.form.prix = '';
	$scope.form.litres = '';
	$scope.status=[];
	$scope.status.opened=false;

	$scope.consommations=[];
	$http.get("./api/voitures/1/consommations").success(function(data){
		$scope.consommations=data;
	});

	$scope.toggle = function() {
		$scope.status.opened=!$scope.status.opened;
	}

	$scope.addConsommation = function() {
		$http.post("./api/create/consommations", {date: $scope.form.date.toISOString().substring(0, 10), prix: $scope.form.prix, litres: $scope.form.litres, id_voiture: "1"}).success(function(data){
			$scope.consommations.unshift(data);
			$scope.form.date = new Date();
			$scope.form.prix = '';
			$scope.form.litres = '';
		});
	}
});
