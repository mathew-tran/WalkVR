extends AudioStreamPlayer3D


# Called when the node enters the scene tree for the first time.
func _ready():
	EventManager.Pickup.connect(OnPickup)
	
func OnPickup():
	play()
