define ['angular' ], (angular) ->

  GameEngine = -> Phaser

  angular
    .module 'main.service', []
    .factory 'GameEngine', GameEngine