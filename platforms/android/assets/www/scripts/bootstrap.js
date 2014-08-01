define(['require', 'angular', 'pace', 'app', 'routes', 'impl'], function(require, angular, pace) {
  'use strict';
  return require(['domReady'], function(document) {
    pace.start();
    return angular.bootstrap(document, ['app']);
  });
});
