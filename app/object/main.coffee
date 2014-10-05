define [
  'angular'
  './bird'
  './ground'
], (angular, Bird, Ground) ->

  gameObject = ->
    Bird: Bird
    Ground: Ground

  angular
    .module 'game.gameObject', []
    .factory 'gameObject', gameObject
