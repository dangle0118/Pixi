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

      @game.input.keyboard.addKeyCapture [Phaser.Keyboard.SPACEBAR]

      flapKey = @input.keyboard.addKey Phaser.Keyboard.SPACEBAR
      flapKey.onDown.add @bird.flap, @bird
      @input.onDown.add @bird.flap, @bird

      @pipeGenerator = @game.time.events.loop Phaser.Timer.SECOND * 1.25, @generatePipes, this
      @pipeGenerator.timer.start()


    update: ->
      @game.physics.arcade.collide @bird, @ground, @deathHandler, null, this
      @pipes.forEach (pipeGroup) =>
        @game.physics.arcade.collide @bird, pipeGroup, @deathHandler, null, this



    generatePipes: ->
      pipeY = @game.rnd.integerInRange -100, 100
      pipeGroup = @pipes.getFirstExists false
      if !pipeGroup
        pipeGroup = new @gameObject.PipeGroup(@game, @pipes)
      pipeGroup.reset(@game.width + pipeGroup.width/2, pipeY)

    deathHandler: ->
      console.log 'end'
#      @game.state.start 'GameOver'

    shutdown: ->
      @game.input.keyboard.removeKey Phaser.Keyboard.SPACEBAR
      @bird.destroy()
      @pipes.destroy()
















