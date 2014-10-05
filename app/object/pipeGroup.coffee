define [ './pipe', 'phaser'], (Pipe) ->

  class PipeGroup extends Phaser.Group
    constructor: (@game, parent) ->
      super(@game, parent)

      @topPipe = new Pipe(@game, 0, 0, 0)
      @add @topPipe

      @bottomPipe = new Pipe(@game, 0, 440, 1)
      @add @bottomPipe

      @hasScored = false

      @setAll 'body.velocity.x', -200

    reset: (x, y) ->
      @topPipe.reset 0, 0
      @bottomPipe.reset 0, 440

      @.x = x
      @.y = y

      @setAll 'body.velocity.x', -200

      @hasScore = false
      @.exists = true

    checkWorldBounds: ->
      if !@topPipe.inWorld
        @.exists = false







