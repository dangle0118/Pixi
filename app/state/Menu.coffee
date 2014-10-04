define ['phaser'], ->

  class Menu extends Phaser.State
    constructor:  ->
      super

    create: ->
      @background = @game.add.sprite 0, 0, 'background'

      @ground = @game.add.tileSprite 0, 400, 335, 112, 'ground'
      @ground.autoScroll -200, 0

      @tileGroup = @game.add.group()

      @title = @game.add.sprite 0, 0, 'title'
      @tileGroup.add @title

      @bird = @game.add.sprite 200, 5, 'bird'
      @tileGroup.add @bird

      @bird.animations.add 'flap'
      @bird.animations.play 'flap', 12, true

      @tileGroup.x = 30;
      @tileGroup.y = 100;

      @game.add.tween(@tileGroup).to({y:115}, 350, Phaser.Easing.Linear.NONE, true, 0, 1000, true)

      @startButton = @game.add.button(@game.width/2, 300, 'startButton', @startClick, @)
      @startButton.anchor.setTo 0.5, 0.5

      return

    startClick: =>
      @game.state.start 'Play'
      return














