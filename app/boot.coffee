require [
  'angular'
  'phaser'
  'ui-bootstrap'
  'main'
  'state'
  'object'
  'service'
], (angular) ->
    angular.bootstrap document, ['ui.bootstrap', 'pixiApp', 'game.gameState', 'game.gameObject', 'main.service']
