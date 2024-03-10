extends HBoxContainer

@onready var heartGUI = preload("res://heart.tscn")
@onready var bush := $"../../bush"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_max_health(max: int):
	for i in range(max):
		var heart = heartGUI.instantiate()
		add_child(heart)

func damage():
	var hearts = get_children()
	
	for i in range(bush.health+1):
		hearts[bush.health].update(true)
