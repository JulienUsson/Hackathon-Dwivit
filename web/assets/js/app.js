var app = angular.module('Dwivit', ['ngRoute']);

app.config(function($routeProvider) {
	$routeProvider.
    when('/', {
			templateUrl : './assets/templates/home.html'
    }).
		when('/gestion', {
			templateUrl : './assets/templates/gestion.html'
		}).
    otherwise({
			redirectTo: '/'
		});
});
