define ['angular', 'pixi', 'ui-router' ],
  (angular, PIXI) ->
    
    
    class MainCtrl
      constructor: ($scope)->
        $scope.init = 'hello world'

        $scope.show = ->
          stage = $scope.stage
          renderer = $scope.renderer

          farTexture = PIXI.Texture.fromImage 'img/bg-far.png'
          farSprite = new PIXI.TilingSprite farTexture, 512, 256
          farSprite.position.x = 0
          farSprite.position.y = 0
          farSprite.tilePosition.x = 0
          farSprite.tilePosition.y = 0
          stage.addChild farSprite

          midTexture = PIXI.Texture.fromImage "img/bg-mid.png"
          mid = new PIXI.TilingSprite midTexture, 512, 256
          mid.position.x = 0
          mid.position.y = 128
          mid.tilePosition.x = 0
          mid.tilePosition.y = 0
          stage.addChild mid
          update = ->
            farSprite.tilePosition.x -= 0.056
            mid.tilePosition.x -= 0.8
            renderer.render stage
            window.requestAnimFrame update
            console.log 'hello'
            return

          window.requestAnimFrame update
          return




    PixiRender = ($window)->
      restrict: 'A'
      scope:
        pixi: '='
        renderer: '='
      link: (scope, elm, attr) ->
        scope.pixi = new PIXI.Stage 0x66FF99
        scope.renderer = PIXI.autoDetectRenderer 512, 384, elm[0]


    angular.module 'pixiApp', ['ui.router']
      .run [
        '$rootScope'
        '$state'
        '$stateParams'
        ($rootScope, $state, $stateParams) ->
          $rootScope.$state = $state
          $rootScope.$stateParams = $stateParams
      ]
      .directive 'pixiRender', ['$window', PixiRender]
      .controller 'MainCtrl', ['$scope',MainCtrl ]


    



