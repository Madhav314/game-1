extends Label

@onready var player := $"../../player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Bats Slain: " + str(player.kills)
