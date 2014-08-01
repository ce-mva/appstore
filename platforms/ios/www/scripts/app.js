define(['angular', 'lodash', 'json2', 'ionic', 'ionic-angular', './config', './shared/controllers', './shared/directives', './shared/filters', './shared/services'], function(angular) {
  'use strict';
  return angular.module('app', ['ionic', 'app.constants', 'app.services', 'app.controllers', 'app.filters', 'app.directives']).run(function($ionicPlatform) {
    return $ionicPlatform.ready(function() {
      if (navigator.splashscreen) {
        setTimeout((function() {
          return navigator.splashscreen.hide();
        }), 100);
      }
      if (navigator.notification) {
        window.alert = function(message) {
          return navigator.notification.alert(message, null, 'MVA Appstore', 'OK');
        };
        window.confirm = function(message) {
          return navigator.notification.confirm(message, null, 'MVA Appstore', 'OK');
        };
        window.prompt = function(message) {
          return navigator.notification.prompt(message, null, 'MVA Appstore', 'OK', 'Next?');
        };
      }
      if (window.StatusBar) {
        return StatusBar.styleBlackTranslucent();
      }
    });
  });
});
