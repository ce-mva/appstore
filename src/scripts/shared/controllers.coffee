define ['angular', 'ionic', './services', '../config'], (angular) ->
  'use strict'

  angular.module 'app.controllers', ['app.services', 'app.constants']
    .run ($ionicLoading, $rootScope) ->
