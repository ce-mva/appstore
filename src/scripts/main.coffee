require.config {
  paths:
    jquery:                       '../lib/jquery/dist/jquery.min'
    domReady:                     '../lib/domready/ready.min'
    angular:                      '../lib/angular/angular.min'
    'angular-animate':            '../lib/angular-animate/angular-animate.min'
    'angular-sanitize':           '../lib/angular-sanitize/angular-sanitize.min'
    'ui-router':                  '../lib/angular-ui-router/release/angular-ui-router.min'
    lodash:                       '../lib/lodash/dist/lodash.min'
    restangular:                  '../lib/restangular/dist/restangular.min'
    json2:                        '../lib/json/json2'
    'ionic':                      '../lib/ionic/js/ionic.min'
    'ionic-angular':              '../lib/ionic/js/ionic-angular.min'
    pace:                         '../lib/pace/pace.min'

  # baseUrl: '/'

  shim:
    'angular':            {deps: ['jquery'], exports: 'angular'}
    'angular-animate':    {deps: ['angular'], exports: 'ngAnimate'}
    'angular-sanitize':   {deps: ['angular'], exports: 'ngSanitize'}
    'ui-router':          {deps: ['angular']}
    'restangular':        {deps: ['angular', 'lodash']}
    'json2':              {exports: 'JSON'}
    'lodash':             {exports: '_'}
    'ionic-angular':      {
                            deps:[
                              'angular'
                              'angular-animate'
                              'angular-sanitize'
                              'ui-router'
                            ],
                            exports: 'ionic-angular'
                          }

  priority: [
    'angular'
    'ionic-angular'
  ]

  urlArgs: "bust=" + (new Date()).getTime()
  # waitSeconds: 100

}

# kickstart application
require ['./bootstrap'], () ->
