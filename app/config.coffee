require.config
  baseUrl: 'http://localhost:3030/'
  packages: [

  ]
  shim:
    'angular':
      exports: 'angular'
    'btford.socket-io':
      deps: ['angular', 'socket.io']
    'ui-router':
      deps: ['angular']
    'ui-bootstrap':
      deps: ['angular']
    'pixi':
      exports: 'pixi'

  paths:
    'angular': 'lib/bower_components/angular/angular'
    'btford.socket-io': 'lib/bower_components/angular-socket-io/socket'
    'socket.io': 'lib/socket.io'
    'ui-router': 'lib/bower_components/angular-ui-router/release/angular-ui-router'
    'ui-bootstrap': 'lib/bower_components/angular-bootstrap/ui-bootstrap-tpls'
    'pixi': 'lib/pixi/pixi.dev'

  modules:
    name: 'boot'
  priority:
    ['angular']