define ['phaser'], ->

  class Bird extends Phaser.Sprite
    constructor: (@game, x, y, frame) ->
      super(@game, x, y, 'bird', frame)
      @anchor.setTo 0.5, 0.5

      @animations.add 'flap'
      @animations.play 'flap', 12, true

      @isAlive = false

      @game.physics.arcade.enableBody(this)
      @body.allowGravity = false

      @flapSound = @game.add.audio 'flap'

    update: ->
      if @angle < 90 and @isAlive
        @angle = @angle + 2.5

    flap: ->
      @body.velocity.y = -400
      @game.add.tween(this).to({angle: -40}, 100).start()
      @flapSound.play()









