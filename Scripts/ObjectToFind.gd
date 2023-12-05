extends Area3D

@export var FindMeText = ""

func _ready():
	add_to_group("FindMe")
	if get_node_or_null("AnimationPlayer"):
		$AnimationPlayer.play("animation")
	
func GetFindText():
	return FindMeText
