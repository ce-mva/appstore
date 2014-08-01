define(['angular', 'ionic', './services', '../config'], function(angular) {
  'use strict';
  return angular.module('app.controllers', ['app.services', 'app.constants']).run(function($ionicLoading, $rootScope) {});
});
