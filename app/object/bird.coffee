define ['phaser'], ->

  class Bird extends Phaser.Sprite
    constructor: (@game, x, y, frame) ->
      super(@game, x, y, 'bird', frame)
      @anchor.setTo 0.5, 0.5

      @animations.add 'flap'
      @animations.play 'flap', 12, true

      @game.physics.arcade.enableBody(this)









