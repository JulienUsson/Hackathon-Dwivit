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
  $scope.repars = [];
/*
{"id_reparation":"2","date":"2015-11-04","commentaire":"Rien \u00e0 signaler.","id_type_reparation":"7","id_voiture":"1","type_reparation":"R\u00e9vision"},{"id_reparation":"1","date":"2015-09-03","commentaire":"Rien \u00e0 signaler.","id_type_reparation":"1","id_voiture":"1","type_reparation":"Changement de pneu"}
*/
  $http.get("http://devweb.isima.fr/api/voitures/1/reparations").success(function (data) {
    $scope.repars = data;
  });
})
.controller('ConsosCtrl', function($scope, $http, $ionicModal) {
  $scope.consommations = [];
/*
{"id_consommation_essence":"3","date":"2015-12-12","prix":"25","litres":"1000","prix_litre":"0.025","id_voiture":"1"},{"id_consommation_essence":"1","date":"2015-12-02","prix":"38.4","litres":"30","prix_litre":"1.280","id_voiture":"1"},{"id_consommation_essence":"2","date":"2015-11-04","prix":"46.2","litres":"35","prix_litre":"1.320","id_voiture":"1"}
*/
  $scope.calcTotalConso = function() {
    var tt = 0;
    for(var conso in $scope.consommations) {
      tt += parseFloat($scope.consommations[conso].prix);
    }
    return Number((tt).toFixed(2));
  };
  $scope.calcTotalKm = function() {
    
  };

  $scope.roundNum = function (num) {
    return Number((parseFloat(num)).toFixed(2));
  };
  
  $http.get("http://devweb.isima.fr/api/voitures/1/consommations").success(function (data) {
    $scope.consommations = data;
    $scope.consommations.forEach(function(element, index, array) {
      if((index+1)<array.length) {

        var nn = parseFloat((element['litres']/(element['compteur_km']-array[index+1]['compteur_km']))*100);
        element['litres_100']=Number((nn).toFixed(2));
      }
      else {
        element['litres_100']=0;
      }
    });
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

  $scope.submitModal = function (litres, total, kms) {
    var date = new Date();
    var prix = total;

    $http.post("http://devweb.isima.fr/api/create/consommations", {compteur_km: kms, date: date.toISOString().substring(0, 10), prix: prix, litres: litres, id_voiture: "1"}).success(function(data){
      $scope.consommations.unshift(data);
          $scope.consommations.forEach(function(element, index, array) {
      if((index+1)<array.length) {

        var nn = parseFloat((element['litres']/(element['compteur_km']-array[index+1]['compteur_km']))*100);
        element['litres_100']=Number((nn).toFixed(2));
      }
      else {
        element['litres_100']=0;
      }
    });
      $scope.modal.hide();
    });
  };


})
.controller('StatsCtrl', function($scope, $http) {

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

  $scope.graphs.reparation.labels = ['06/2015', '07/2015', '08/2015', '09/2015', '10/2015', '11/2015', '12/2015'];
  $scope.graphs.reparation.data = [
    [0, 0, 0, 1, 0, 1, 0]
  ];

  $http.get("http://devweb.isima.fr/api/voitures/1/consommations").success(function(data){
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