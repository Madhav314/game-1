extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var player := $"../player"
var health: int = 10

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	_animated_sprite.play("fly")
	velocity = direction * 50
	move_and_slide()


#Bats get killed in one hit, need to fix
func _on_area_2d_area_entered(area):
	if area.is_in_group("sword"):
		health =- 1
		print(health)
	if(health <= 0):
		queue_free()
	

