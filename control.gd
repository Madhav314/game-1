extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://world.tscn")


func _on_quit_pressed():
	var save = FileAccess.open("res://savegame.save", FileAccess.WRITE)
	var line = JSON.stringify({"filename":"res://player.tscn","kills":0,"parent":"/root/World","pos_x":261,"pos_y":115})
	var line2 = JSON.stringify({"filename":"res://bush.tscn","health":5,"parent":"/root/World","pos_x":261,"pos_y":166})

	save.store_line(line)
	save.store_line(line2)
	get_tree().quit()
	
