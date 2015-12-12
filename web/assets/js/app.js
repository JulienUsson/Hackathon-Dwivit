var app = angular.module('Dwivit', ['ngRoute', 'ui.bootstrap', 'chart.js']);

app.config(function($routeProvider) {
	$routeProvider.
    when('/', {
			templateUrl : './assets/templates/home.html'
    }).
		when('/gestion', {
			templateUrl : './assets/templates/gestion.html',
			controller  : 'gestionController'
		}).
		when('/gestion/reparation', {
			templateUrl : './assets/templates/reparation.html',
			controller  : 'reparationController'
		}).
		when('/gestion/consommation', {
			templateUrl : './assets/templates/consommation.html',
			controller  : 'consommationController'
		}).
		when('/gestion/statistique', {
			templateUrl : './assets/templates/statistique.html',
			controller  : 'statistiqueController'
		}).
    otherwise({
			redirectTo: '/'
		});
});

app.controller('gestionController', function($scope, $http) {

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
	$scope.form.prix = 0;
	$scope.form.litres=0;
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
			$scope.form.prix = 0;
			$scope.form.litres=0;
		});
	}
});
