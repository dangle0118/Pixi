define [
  'angular'
  'ui-router'
], (
  angular
) ->


    
  class MainCtrl
    constructor: ($scope, GameEngine, Preload, Menu) ->
      $scope.init = 'hello world'

      console.log Preload
      game = new GameEngine.Game(288, 505, GameEngine.AUTO, 'gamestage')

      game.state.add 'Boot', Preload
      game.state.add 'Menu', Menu


      game.state.start 'Boot'







  PixiRender = ($window)->
    restrict: 'A'
    scope:
      pixi: '='
      renderer: '='
    link: (scope, elm, attr) ->
#        scope.pixi = new PIXI.Stage 0x66FF99
#        scope.renderer = PIXI.autoDetectRenderer 512, 384, elm[0]


  angular.module 'pixiApp', ['ui.router', 'gameState']
    .run [
      '$rootScope'
      '$state'
      '$stateParams'
      ($rootScope, $state, $stateParams) ->
        $rootScope.$state = $state
        $rootScope.$stateParams = $stateParams
    ]
    .directive 'pixiRender', ['$window', PixiRender]
    .controller 'MainCtrl', ['$scope', 'GameEngine', 'Preload', 'Menu',  MainCtrl ]


    



