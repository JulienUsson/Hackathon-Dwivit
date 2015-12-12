var app = angular.module('Dwivit', ['ngRoute']);

app.config(function($routeProvider) {
	$routeProvider.
    when('/', {
			templateUrl : './assets/templates/home.html'
    }).
    otherwise({
			redirectTo: '/'
		});
});
