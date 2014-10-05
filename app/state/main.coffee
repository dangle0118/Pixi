define [
  'angular'
  './Preload'
  './Menu'
  './Play'
  'phaser'
], (angular, Preload, Menu, Play) ->

  angular
    .module 'game.gameState', ['game.gameObject']
    .service 'Preload', ['GameEngine', Preload]
    .service 'Menu', Menu
    .service 'Play',  ['gameObject', Play]