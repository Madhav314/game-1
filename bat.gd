extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var player := $"../player"

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	_animated_sprite.play("fly")
	velocity = direction * 50
	move_and_slide()
