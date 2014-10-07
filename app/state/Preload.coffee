define ['phaser'], ->

  class Preload extends Phaser.State
    constructor: ->
      super
    preload: ->
      @game.load.onLoadComplete.addOnce(@onLoadComplete, @game)

      @game.load.image 'background', '../img/flappybird/background.png'
      @game.load.image 'ground', '../img/flappybird/ground.png'
      @game.load.image 'title', '../img/flappybird/title.png'
      @game.load.image 'startButton', '../img/flappybird/start-button.png'
      @game.load.spritesheet 'bird', '../img/flappybird/bird.png', 34, 24, 3
      @game.load.spritesheet 'pipe', '../img/flappybird/pipes.png', 54, 320, 2

      @game.load.image 'instructions', '../img/flappybird/instructions.png'
      @game.load.image 'getReady', '../img/flappybird/get-ready.png'

      @game.load.bitmapFont 'flappyfont', '../fonts/flappyfont/flappyfont.png', '../fonts/flappyfont/flappyfont.fnt'

      @game.load.audio 'score', '../sound/score.wav'
      @game.load.audio 'flap', '../sound/flap.wav'
      @game.load.audio 'pipeHit', '../sound/pipe-hit.wav'
      @game.load.audio 'groundHit', '../sound/ground-hit.wav'

      return

    update: ->
      if @ready is true
        @game.state.start 'Play'
      return

    onLoadComplete: =>
      @ready = true
      return













