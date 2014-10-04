define [
  'angular'
  './Preload'
  './Menu'
  'phaser'
], (angular, Preload, Menu) ->

  angular
    .module 'gameState', []
    .service 'Preload', ['GameEngine', Preload]
    .service 'Menu', Menu