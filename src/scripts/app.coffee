define [
  'angular'
  'lodash'
  'json2'
  'ionic'
  'ionic-angular'
  './config'
  './shared/controllers'
  './shared/directives'
  './shared/filters'
  './shared/services'
], (angular) ->
  'use strict'
  angular.module('app', [
    'ionic'
    'app.constants'
    'app.services'
    'app.controllers'
    'app.filters'
    'app.directives'
  ])
  .run ($ionicPlatform) ->

    $ionicPlatform.ready ->
      if navigator.splashscreen
        setTimeout ( ->
          navigator.splashscreen.hide()
        ), 100

      if navigator.notification
        window.alert = (message) ->
          navigator.notification.alert(
            message
            null
            'MVA Appstore'
            'OK'             #buttonName
          )
        window.confirm = (message) ->
          navigator.notification.confirm(
            message
            null
            'MVA Appstore'
            'OK'
          )
        window.prompt = (message) ->
          navigator.notification.prompt(
            message
            null
            'MVA Appstore'
            'OK'
            'Next?'
          )

      if window.StatusBar
        StatusBar.styleBlackTranslucent()
