extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var player := $"../player"
var health: int = 10

func _physics_process(delta):
	
	if(health > 0):
		var direction = global_position.direction_to(player.global_position)
		_animated_sprite.play("fly")
		velocity = direction * 50
		move_and_slide()
	else:
		_animated_sprite.play("death")
		if(_animated_sprite.frame == 9):
			queue_free()

func _on_area_2d_area_entered(area):
	if area.is_in_group("sword"):
		health = health - 5
		print(health)

		
