define(['angular'], function(angular) {
  'use strict';
  return angular.module('app.constants', []).constant('config', {
    server_uri: 'http://localhost:8000'
  });
});
