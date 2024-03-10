extends Panel

@onready var sprite = $Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update(hit: bool):
	if(hit):
		sprite.frame = 1
	else:
		sprite.frame = 0;
