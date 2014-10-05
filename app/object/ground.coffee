define ['phaser'], ->

  class Ground extends Phaser.TileSprite
    constructor: (@game, x, y, width, height) ->
      super(@game, x, y, width, height, 'ground')

      @autoScroll -200, 0

      @game.physics.arcade.enableBody(this)
      @body.allowGravity = false
      @body.immovable = true


