extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

@onready var face = "down"

func _physics_process(delta):

	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if(Input.is_action_pressed("move_left")):
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
	elif(Input.is_action_pressed("attack")):
		_animated_sprite.play("attack_" + face)
	else:
		_animated_sprite.play("idle_" + face)
	
		
	velocity = direction * 100
	move_and_slide()

