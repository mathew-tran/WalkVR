extends CSGBox3D

var bIsActivated = false

func _on_area_3d_body_entered(body):
	if bIsActivated == false:
		bIsActivated = true
		$AnimationPlayer.play("activate")
		print("done")
		EventManager.BroadcastPickup()


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "activate":
		queue_free()
