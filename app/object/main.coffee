define [
  'angular'
  './bird'
  './ground'
  './pipeGroup'
], (angular, Bird, Ground, PipeGroup) ->

  gameObject = ->
    Bird: Bird
    Ground: Ground
    PipeGroup: PipeGroup

  angular
    .module 'game.gameObject', []
    .factory 'gameObject', gameObject
