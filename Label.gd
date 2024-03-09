extends Label

@onready var player := $"../../player"

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Bats Slayn: 0" + str(player.kills)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Bats Slayn: " + str(player.kills)
