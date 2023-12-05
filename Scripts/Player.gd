extends RigidBody3D


@onready var LeftHand = $Left/Hand
@onready var RightHand = $Right/Hand
@onready var FlashLight = $Right/Hand/OmniLight3D

var StartingY = 0
var ResetText = "Hold Trigger / Grip Buttons for 3 seconds to reset"
# Called when the node enters the scene tree for the first time.

func _ready():
	EventManager.ChoseCorrectObject.connect(OnChoseCorrectObject)
	EventManager.QuestChange.connect(OnQuestChange)
	EventManager.ToggleMusic.connect(OnToggleMusicChange)
	FlashLight.visible = false
	$Right.button_pressed.connect(OnRightButtonPressed)
	
	if Game.bPlayMusic:
		$AudioStreamPlayer3D.play()
	
func OnToggleMusicChange():
	Game.bPlayMusic = !Game.bPlayMusic
	if Game.bPlayMusic:
		$AudioStreamPlayer3D.play()
	else:
		$AudioStreamPlayer3D.stop()
		$AudioStreamPlayer3D/Timer.stop()

func OnRightButtonPressed(buttonName):
	print(buttonName) 
	if buttonName == "grip_click":
		FlashLight.visible = !FlashLight.visible
		$FlashClick.play()
	
func OnQuestChange():
	$AnimationPlayer.play("questchange")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if LeftHand.IsMoving() and RightHand.IsMoving():
		var forwarddir = -$Player/XRCamera3D.transform.basis.z
		forwarddir.y = 0
		var velocity = forwarddir * 30 * delta
		apply_impulse(velocity)
		var currentVelocity = linear_velocity
		var maxVelocity = 30
		if currentVelocity.length() > maxVelocity:
			linear_velocity = currentVelocity.normalized() * maxVelocity
		EventManager.BroadcastStep()
		OnChoseCorrectObject()

		
	if $Left.is_button_pressed("grip_click") and $Left.is_button_pressed("trigger_click"):
		if $Right.is_button_pressed("grip_click") and $Right.is_button_pressed("trigger_click"):			
			if $Timer.time_left == 0.0:
				$Timer.start()
		else:
			$Timer.stop()
	else:
		$Timer.stop()
		
	$Right/Hand/Hint.text = ResetText	
	if $Timer.time_left != 0.0:
		$Right/Hand/Hint.text += "\n\n Progress: " + str(snapped($Timer.wait_time - $Timer.time_left, .1)) + "/" + str($Timer.wait_time)

	
func OnChoseCorrectObject():
	pass
	



func _on_timer_timeout():
	get_tree().reload_current_scene()


func _on_audio_stream_player_3d_finished():
	if Game.bPlayMusic:
		$AudioStreamPlayer3D/Timer.start()


func _on_timerAudio_timeout():
	if Game.bPlayMusic:
		$AudioStreamPlayer3D.play()
