define ['phaser'], ->


  class Pipe extends Phaser.Sprite
    constructor: (@game, x, y, frame) ->
      super(@game, x, y, 'pipe', frame)
      @anchor.setTo 0.5, 0.5

      @game.physics.arcade.enableBody(this)
      @body.allowGravity = false
      @body.immovable = true