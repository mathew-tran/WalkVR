extends Node3D


var CurrentPosition = Vector3.ZERO
var LastVelocity = Vector3.ZERO

var NormalMaterial = preload("res://Materials/HandNormalMaterial.tres")
var ValidMaterial = preload("res://Materials/HandValidMaterial.tres")

func _ready():
	get_parent().button_released.connect(OnButtonReleased)
	$RayCast3D.visible = false
	
func OnButtonReleased(buttonName):
	if buttonName == "trigger_click":
		CheckRaycastForButton()
		$RaycastTimer.start()
		$RayCast3D.visible = true
	
func GetVelocity():
	return LastVelocity

func _on_timer_timeout():
	var newPosition = get_parent().position
	newPosition.z = 0
	newPosition.x = 0
	LastVelocity = newPosition - CurrentPosition
	CurrentPosition = newPosition
	#$Label3D.text = "Moving:" + str(IsMoving())
	$Label3D.text = str(LastVelocity.length())
	#$Label3D.text = str(get_parent().position)

func IsMoving():
	return LastVelocity.length() > .06
	
func _process(delta):
	if $RayCast3D.visible:
		var collider = $RayCast3D.get_collider()
		if collider:
			$RayCast3D/CSGMesh3D.material = ValidMaterial
		else:
			$RayCast3D/CSGMesh3D.material = NormalMaterial
			
func CheckRaycastForButton():	
	var collider = $RayCast3D.get_collider()
	if collider:
		collider.Press()
		$AudioStreamPlayer3D.play()

func _on_area_3d_area_entered(area):
	if area == Game.CurrentQuest:
		EventManager.BroadcastChoseCorrectObject()
		$AudioStreamPlayer3D.play()


func _on_raycast_timer_timeout():
	$RayCast3D.visible = false
