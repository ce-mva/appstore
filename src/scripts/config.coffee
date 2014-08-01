# defines constants for application

define ['angular'], (angular) ->
    'use strict'
    angular.module('app.constants', []).constant('config', {
      server_uri: 'http://localhost:8000'
    })
