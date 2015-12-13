// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['ionic', 'chart.js', 'starter.controllers'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if (window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);

    }
    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });
})

.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider

    .state('app', {
    url: '/app',
    abstract: true,
    templateUrl: 'templates/menu.html',
    controller: 'AppCtrl'
  })

  .state('app.login', {
    url: '/login',
    views: {
      'menuContent': {
        templateUrl: 'templates/login.html',
        controller: 'LoginCtrl'
      }
    }
  })

  .state('app.infos', {
    url: '/infos/:user',
    views: {
      'menuContent': {
        templateUrl: 'templates/infos.html',
        controller: 'InfosCtrl'
      }
    }
  })
  .state('app.consos', {
    url: '/consos',
    views: {
      'menuContent': {
        templateUrl: 'templates/consos.html',
        controller: 'ConsosCtrl'
      }
    }
  })
  .state('app.repars', {
    url: '/repars',
    views: {
      'menuContent': {
        templateUrl: 'templates/repars.html',
        controller: 'ReparsCtrl'
      }
    }
  })
  .state('app.stats', {
    url: '/stats',
    views: {
      'menuContent': {
        templateUrl: 'templates/stats.html',
        controller: 'StatsCtrl'
      }
    }
  })
  .state('app.apropos', {
    url: '/apropos',
    views: {
      'menuContent': {
        templateUrl: 'templates/apropos.html',
      }
    }
  });

    // if none of the above states are matched, use this as the fallback
    $urlRouterProvider.otherwise('/app/login');
  });
