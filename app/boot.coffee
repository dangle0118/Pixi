require [
  'angular'
  'phaser'
  'ui-bootstrap'
  'main'
  'state'
  'service'
], (angular) ->
    angular.bootstrap document, ['ui.bootstrap', 'pixiApp', 'gameState', 'main.service']
