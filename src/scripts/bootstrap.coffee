# bootstrap angular into the document
define [
  'require'
  'angular'
  'pace'
  'app'
  'routes'
  'impl'
], (require, angular, pace) ->
  'use strict'

  require ['domReady'], (document) ->
    pace.start()
    angular.bootstrap document, ['app']
