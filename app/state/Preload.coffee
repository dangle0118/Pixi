define ['phaser'], ->

  class Preload extends Phaser.State
    ms = @
    constructor: ->
      super
    preload: ->
      @game.load.onLoadComplete.addOnce(@onLoadComplete, @game)

      @game.load.image 'background', '../img/flappybird/background.png'
      @game.load.image 'ground', '../img/flappybird/ground.png'
      @game.load.image 'title', '../img/flappybird/title.png'
      @game.load.image 'startButton', '../img/flappybird/start-button.png'
      @game.load.spritesheet 'bird', '../img/flappybird/bird.png', 34, 24, 3
      return

    update: ->
      if @ready is true
        @game.state.start 'Play'
      return

    onLoadComplete: =>
      @ready = true
      return













