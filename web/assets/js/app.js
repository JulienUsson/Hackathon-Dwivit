var app = angular.module('Dwivit', ['ngRoute', 'ngAnimate', 'ui.bootstrap', 'chart.js']);

app.config(function($routeProvider) {
	$routeProvider.
    when('/', {
			templateUrl : './assets/templates/home.html',
			controller  : 'homeController'
    }).
		when('/compte', {
			templateUrl : './assets/templates/compte.html',
			controller  : 'compteController'
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

app.controller('homeController', function($rootScope, $scope, $http, $sce, $location) {
	$scope.slides=[
		{image: "assets/img/slide1.jpg", titre: $sce.trustAsHtml('Un forfait <span class="jaune">tout compris</span>'), texte: "Vos révision, le remplacement des pièces d'usures et l'assistance sont inclus."},
		{image: "assets/img/slide2.jpg", titre: $sce.trustAsHtml('Une solution <span class="jaune">simple</span>'), texte: "Vous adaptez votre forfait à votre véhicule."},
		{image: "assets/img/slide3.jpg", titre: $sce.trustAsHtml('Pas de mauvaise <span class="jaune">surprise</span>'), texte: "Votre véhicule toujout prêt à rouler, en tout sécurité."}
	];

	if($rootScope.loggedIn)
		$location.url('/compte');
});

app.controller('menuController', function($rootScope, $scope, $http, $location, $anchorScroll, $window) {
	$scope.form=[];
	$scope.form.login="";
	$scope.form.password="";

	$scope.login = function() {
		$rootScope.loggedIn=true;
		$scope.form.password="";
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

app.controller('compteController', function($rootScope, $scope, $http, $location) {
	if(!$rootScope.loggedIn)
		$location.url('/');

	$scope.user={};
	$http.get("./api/users/1/").success(function(data){
		$scope.user=data;
	});

	$scope.voiture={};
	$http.get("./api/voitures/1/").success(function(data){
		$scope.voiture=data;
	});
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

app.controller('reparationController', function($rootScope, $scope, $http, $location) {
	if(!$rootScope.loggedIn)
		$location.url('/');

	$scope.reparations=[];
	$http.get("./api/voitures/1/reparations").success(function(data){
		$scope.reparations=data;
	});

	$scope.user={};
	$http.get("./api/users/1/").success(function(data){
		$scope.user=data;
	});
});

app.controller('statistiqueController', function($rootScope, $scope, $http, $location) {
	if(!$rootScope.loggedIn)
		$location.url('/');

	$scope.graphs=[];
	$scope.graphs.consoQte=[];
	$scope.graphs.consoQte.series = ['Quantité en litre'];
	$scope.graphs.consoQte.labels=[];
	$scope.graphs.consoQte.data=[];
	$scope.graphs.consoPrix=[];
	$scope.graphs.consoPrix.series = ['Prix au litre'];
	$scope.graphs.consoPrix.labels=[];
	$scope.graphs.consoPrix.data=[];
	$scope.graphs.reparation=[];
	$scope.graphs.reparation.series = ["Nombre d'intervention"];
	$scope.graphs.reparation.labels=[];
	$scope.graphs.reparation.data=[];

	$scope.graphs.reparation.labels = ['06/2015', '07/2015', '08/2015', '09/2015', '10/2015', '11/2015', '12/2015'];
	$scope.graphs.reparation.data = [
		[0, 0, 0, 1, 0, 1, 0]
	];

	$http.get("./api/voitures/1/consommations").success(function(data){
		var prix=[];
		var quantite=[];
		data.forEach(function(element, index, array) {
			$scope.graphs.consoQte.labels.push(element["date"]);
			prix.push(element["prix_litre"]);
			quantite.push(element["litres"]);
		});
		$scope.graphs.consoQte.data=[quantite];
		$scope.graphs.consoPrix.labels=$scope.graphs.consoQte.labels.slice();
		$scope.graphs.consoPrix.data=[prix];
	});
});


app.controller('consommationController', function($rootScope, $scope, $http, $location) {
	if(!$rootScope.loggedIn)
		$location.url('/');

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
