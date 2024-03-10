extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var _audio_sprite = $AudioStreamPlayer2D
@onready var player := $"../player"
@onready var bush := $"../bush"
@onready var hearts = $"../CanvasLayer/HBoxContainer"

@onready var health: int = 10

func _physics_process(delta):
	
	if(health > 0):
		var direction = global_position.direction_to(bush.global_position)
		_animated_sprite.play("fly")
		velocity = direction * 50
		move_and_slide()
	else:
		_animated_sprite.play("death")
		if(_animated_sprite.frame == 9):
			player.kills += 1
			queue_free()

func _on_area_2d_area_entered(area):
	if area.is_in_group("sword"):
		health = health - 5
		if(health > 0):
			_audio_sprite.stream = load("res://assets/Action RPG Resources/Music and Sounds/Hit.wav")
			_audio_sprite.play()
		else:
			_audio_sprite.stream = load("res://assets/Action RPG Resources/Music and Sounds/EnemyDie.wav")
			_audio_sprite.play()
	if area.is_in_group("health"):
		bush.health = bush.health - 1
		hearts.damage()
		print(bush.health)
		queue_free()
		if(bush.health <= 0):
			get_tree().quit()
