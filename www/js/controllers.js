angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {

})

.controller('LoginCtrl', function($scope, $ionicLoading, $state, 
  $timeout, $ionicHistory) {

  $scope.submitLogin = function (pseudo, pwd) {
    $ionicLoading.show({
      template:'Connexion...'
    });

    $timeout(function() {
      $ionicLoading.hide();

      $ionicHistory.nextViewOptions({
        disableBack: true
      });
      $state.go('app.infos');
    }, 600);
    
  };
})

.controller('InfosCtrl', function($scope, $http) {
  
  $scope.user = {nom: 'McCain', prenom: 'Bobby', email: 'gayo@mail.fr', 
    ville: 'Clermont-Ferrand', code_postal: '63000'};
  $scope.voiture = {immatriculation: 'AB123CD'};
  $scope.contrat = {nom: 'Starter'}

  $http.get("http://devweb.isima.fr/api/users/1/").success(function (data) {
    $scope.user = data;
  });

  $http.get("http://devweb.isima.fr/api/voitures/1").success(function (data) {
    $scope.voiture = data;
  });
})

.controller('ReparsCtrl', function($scope, $http) {
  $scope.repars = [{"id_reparation":"2","date":"2015-11-04","commentaire":"Rien \u00e0 signaler.","id_type_reparation":"7","id_voiture":"1","type_reparation":"R\u00e9vision"},{"id_reparation":"1","date":"2015-09-03","commentaire":"Rien \u00e0 signaler.","id_type_reparation":"1","id_voiture":"1","type_reparation":"Changement de pneu"}];

  $http.get("http://devweb.isima.fr/api/voitures/1/reparations").success(function (data) {
    $scope.repars = data;
  });
})
.controller('ConsosCtrl', function($scope, $http, $ionicModal) {
  $scope.consommations = [{"id_consommation_essence":"3","date":"2015-12-12","prix":"25","litres":"1000","prix_litre":"0.025","id_voiture":"1"},{"id_consommation_essence":"1","date":"2015-12-02","prix":"38.4","litres":"30","prix_litre":"1.280","id_voiture":"1"},{"id_consommation_essence":"2","date":"2015-11-04","prix":"46.2","litres":"35","prix_litre":"1.320","id_voiture":"1"}];

  $scope.calcTotalConso = function() {
    var tt = 0;
    for(var conso in $scope.consommations) {
      tt += parseFloat($scope.consommations[conso].prix);
    }
    return tt;
  };
  
  $http.get("http://devweb.isima.fr/api/voitures/1/consommations").success(function (data) {
    $scope.consommations = data;
  });

  $ionicModal.fromTemplateUrl('modal_consos.html', {
    scope: $scope,
    animation: 'slide-in-up'
  }).then(function(modal) {
    $scope.modal = modal;
  });
  $scope.openModal = function() {
    $scope.modal.show();
  };
  $scope.closeModal = function() {
    $scope.modal.hide();
  };

  $scope.submitModal = function (litres, total) {
    var date = new Date();
    var prix = total/litres;

    $http.post("http://devweb.isima.fr/api/create/consommations", {date: date.toISOString().substring(0, 10), prix: prix, litres: litres, id_voiture: "1"}).success(function(data){
      $scope.consommations.unshift(data);
      calcTotalConso();
      $scope.modal.hide();
    });
  };


})
.controller('StatsCtrl', function($scope) {

});