extends Node2D

@onready var health = $CanvasLayer/HBoxContainer

func _ready():
	health.set_max_health(5)

func _physics_process(delta):
	if(Input.is_action_pressed("switch")):
		get_tree().change_scene_to_file("res://control.tscn")

func _spawn():
	var bat = preload("res://bat.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	bat.global_position = %PathFollow2D.global_position
	add_child(bat)

func _on_timer_timeout():
	_spawn()
