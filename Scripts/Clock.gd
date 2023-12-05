extends Label3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var time = Time.get_datetime_dict_from_system()
	text = "%02d:%02d:%02d" % [time.hour, time.minute, time.second];
