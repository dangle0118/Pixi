define ['phaser'], ->

  class Play extends Phaser.State
    constructor: (@gameObject)->
      super

    create: ->
      @game.physics.startSystem Phaser.Physics.ARCADE
      @game.physics.arcade.gravity.y = 1200

      @background = @game.add.sprite 0,0, 'background'

      @bird = new @gameObject.Bird(@game, @game.width / 2, @game.height / 2)
      @game.add.existing @bird

      @pipes = @game.add.group()

      @ground = new @gameObject.Ground(@game, 0, 400, 335, 112)
      @game.add.existing @ground

      @scoreSound = @game.add.audio 'score'

      @game.input.keyboard.addKeyCapture [Phaser.Keyboard.SPACEBAR]

      flapKey = @input.keyboard.addKey Phaser.Keyboard.SPACEBAR
      flapKey.onDown.addOnce @startGame, this
      flapKey.onDown.add @bird.flap, @bird

      @input.onDown.addOnce @startGame, this
      @input.onDown.add @bird.flap, @bird

      @instructionGroup = @game.add.group()
      @instructionGroup.add @game.add.sprite(@game.width/2, 100, 'getReady')
      @instructionGroup.add @game.add.sprite(@game.width/2, 325, 'instructions')
      @instructionGroup.setAll 'anchor.x', 0.5
      @instructionGroup.setAll 'anchor.y', 0.5

      @score = 0
      @scoreText = @game.add.bitmapText @game.width/2, 10, 'flappyfont', @score.toString(), 24
      @scoreText.visible = false
      return

    update: ->
      @game.physics.arcade.collide @bird, @ground, @deathHandler, null, this
      @pipes.forEach (pipeGroup) =>
        @checkScore pipeGroup
        @game.physics.arcade.collide @bird, pipeGroup, @deathHandler, null, this

    checkScore: (pipeGroup) ->
      if pipeGroup.exists and !pipeGroup.hasScored and (pipeGroup.topPipe.world.x <= @bird.world.x)
        pipeGroup.hasScored = true
        @score = @score + 1
        @scoreText.setText @score.toString()
        @scoreSound.play()


    startGame: ->
      @bird.body.allowGravity = true
      @bird.isAlive = true

      @pipeGenerator = @game.time.events.loop Phaser.Timer.SECOND * 1.25, @generatePipes, this
      @pipeGenerator.timer.start()

      @instructionGroup.destroy()
      @scoreText.visible = true

    generatePipes: ->
      pipeY = @game.rnd.integerInRange -100, 100
      pipeGroup = @pipes.getFirstExists false
      if !pipeGroup
        pipeGroup = new @gameObject.PipeGroup(@game, @pipes)
      pipeGroup.reset(@game.width + pipeGroup.width/2, pipeY)

    deathHandler: ->
      @game.state.start 'Play'

    shutdown: ->
      @game.input.keyboard.removeKey Phaser.Keyboard.SPACEBAR
      @bird.destroy()
      @pipes.destroy()
















