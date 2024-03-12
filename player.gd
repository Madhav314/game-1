extends CharacterBody2D

var attacking: bool = false

var speed: int = 100

var kills: int = 0

@onready var _animated_sprite = $AnimatedSprite2D

@onready var _audio_sprite = $AudioStreamPlayer2D

@onready var face: String = "down"

func _physics_process(delta):

	if(Input.is_action_pressed("attack") or attacking):
		velocity.x = 0
		velocity.y = 0
		Attack()
	elif(Input.is_action_pressed("move_left")):
		_animated_sprite.play("running_left")
		face = "left"
		velocity.x = -100
		velocity.y = 0
	elif(Input.is_action_pressed("move_right")):
		_animated_sprite.play("running_right")
		face = "right"
		velocity.x = 100
		velocity.y = 0
	elif(Input.is_action_pressed("move_up")):
		_animated_sprite.play("running_up")
		face = "up"
		velocity.x = 0
		velocity.y = -100
	elif(Input.is_action_pressed("move_down")):
		_animated_sprite.play("running_down")
		face = "down"
		velocity.x = 0
		velocity.y = 100
	else:
		_animated_sprite.play("idle_" + face)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()

func Attack():
	attacking = true
	get_node("AnimatedSprite2D/hitbox/" + face).disabled = false
	_animated_sprite.play("attack_" + face)
	if(_animated_sprite.frame == 0):
		_audio_sprite.stream = load("res://assets/Action RPG Resources/Music and Sounds/Swipe.wav")
		_audio_sprite.play()
	if(_animated_sprite.frame == 3):
		get_node("AnimatedSprite2D/hitbox/" + face).disabled = true
		attacking = false

func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x,
		"pos_y" : position.y,
		"kills" : kills
	}
	return save_dict
