define [
  'angular'
  'restangular'
  '../config'
], (angular) ->
  'use strict'
  angular.module 'app.services', ['app.constants', 'restangular']
