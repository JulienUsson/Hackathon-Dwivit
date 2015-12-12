var app = angular.module('Dwivit', ['ngRoute']);

app.config(function($routeProvider) {
	$routeProvider.
    when('/', {
			templateUrl : './assets/templates/home.html'
    }).
		when('/gestion', {
			templateUrl : './assets/templates/gestion.html',
			controller  : 'gestionController'
		}).
		when('/gestion/consommation', {
			templateUrl : './assets/templates/consommation.html',
			controller  : 'consommationController'
		}).
    otherwise({
			redirectTo: '/'
		});
});

app.controller('gestionController', function($scope, $http) {

});

app.controller('consommationController', function($scope, $http) {
	$scope.consommations=[];
	$http.get("./api/voitures/1/consommations").success(function(data){
			$scope.consommations=data;
	});
});
