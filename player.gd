extends CharacterBody2D

var attacking: bool = false

var health: int = 100

@onready var _animated_sprite = $AnimatedSprite2D

@onready var _audio_sprite = $AudioStreamPlayer2D

@onready var face: String = "down"

func _physics_process(delta):

	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if(Input.is_action_pressed("attack") or attacking):
		Attack()
	elif(Input.is_action_pressed("move_left")):
		_animated_sprite.play("running_left")
		face = "left"
	elif(Input.is_action_pressed("move_right")):
		_animated_sprite.play("running_right")
		face = "right"
	elif(Input.is_action_pressed("move_up")):
		_animated_sprite.play("running_up")
		face = "up"
	elif(Input.is_action_pressed("move_down")):
		_animated_sprite.play("running_down")
		face = "down"
	else:
		_animated_sprite.play("idle_" + face)
	
	velocity = direction * 100
	move_and_slide()

func Attack():

	attacking = true
	get_node("AnimatedSprite2D/hitbox/" + face).disabled = false
	_animated_sprite.play("attack_" + face)
	if(_animated_sprite.frame == 3):
		get_node("AnimatedSprite2D/hitbox/" + face).disabled = true
		attacking = false


func _on_animated_sprite_2d_animation_changed():
	if(_animated_sprite.animation == ("attack_" + face)):
		_audio_sprite.stream = load("res://assets/Action RPG Resources/Music and Sounds/Swipe.wav")
		_audio_sprite.play()
