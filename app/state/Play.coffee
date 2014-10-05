define ['phaser'], ->

  class Play extends Phaser.State
    constructor: (@gameObject)->
      super

    create: ->
      @game.physics.startSystem Phaser.Physics.ARCADE
      @game.physics.arcade.gravity.y = 500

      @background = @game.add.sprite 0,0, 'background'

      @bird = new @gameObject.Bird(@game, @game.world.randomX, @game.world.randomY)
      @game.add.existing @bird

      @ground = new @gameObject.Ground(@game, 0, 400, 335, 112)
      @game.add.existing @ground

    update: ->
      @game.physics.arcade.collide @bird, @ground













