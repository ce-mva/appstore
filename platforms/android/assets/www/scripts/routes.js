define(['app'], function(app) {
  'use strict';
  return app.config(function($stateProvider, $urlRouterProvider, $locationProvider) {
    $stateProvider.state('home', {
      url: '/',
      templateUrl: 'scripts/start/controllers/home.html',
      controller: 'HomeCtrl'
    });
    $urlRouterProvider.otherwise('/');
    return $locationProvider.html5Mode(false).hashPrefix('');
  });
});
