define ['app'], (app) ->
  'use strict'
  # console.log app.config()

  app.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
    # console.log $stateProvider
    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'scripts/start/controllers/home.html'
        controller: 'HomeCtrl'

    $urlRouterProvider.otherwise('/')

    $locationProvider.html5Mode(false).hashPrefix('')
