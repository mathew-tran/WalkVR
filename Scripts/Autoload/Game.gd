extends Node

var Steps = 0
var CurrentQuest = null
var bPlayMusic = true
var QuestAmount = 10

func SetCurrentQuest(obj):
	CurrentQuest = obj

var interface : XRInterface

func _ready():
	interface = XRServer.find_interface("OpenXR")
	if interface and interface.is_initialized():
		print("we have vr")
		get_viewport().use_xr = true
		
func TriggerHapticPulse(obj):
	if obj and obj.is_initialized():
		obj.trigger_haptic_pulse("blah", "blah", 1,1, 1, .1)
