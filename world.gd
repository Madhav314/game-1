extends Node2D

@onready var health = $CanvasLayer/HBoxContainer

var new_game:bool = true

func _ready():
	health.set_max_health(5)
	#load_game()

func _physics_process(delta):
	if(Input.is_action_pressed("switch")):
		save()
		get_tree().change_scene_to_file("res://control.tscn")

func _spawn():
	var bat = preload("res://bat.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	bat.global_position = %PathFollow2D.global_position
	add_child(bat)

func _on_timer_timeout():
	_spawn()
	
func save():
	var save_game = FileAccess.open("res://savegame.save", FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("save")
	for node in save_nodes:
		print(node)
		var node_data = node.call("save")
		var json_string = JSON.stringify(node_data)
		save_game.store_line(json_string)

func load_game():
	var save_nodes = get_tree().get_nodes_in_group("save")
	for i in save_nodes:
		i.queue_free()
		
	var save_game = FileAccess.open("res://savegame.save", FileAccess.READ)
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		json.parse(json_string)
		var node_data = json.get_data()
		if(node_data == null):
			return
		
		var new_object = load(node_data["filename"]).instantiate()
		get_node(node_data["parent"]).add_child(new_object)
		new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])

		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])
		
		
		
