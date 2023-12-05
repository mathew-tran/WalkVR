extends Node

signal Pickup
signal Step
signal StepUpdate(amount)
signal ChoseCorrectObject
signal RandomizeQuests
signal SetQuestAmount(amount)
signal QuestChange
signal ToggleMusic
signal SetEnvironment(index)

func BroadcastSetEnvironment(index):
	emit_signal("SetEnvironment", index)

func BroadcastToggleMusic():
	emit_signal("ToggleMusic")

func BroadcastSetQuestAmount(amount):
	emit_signal("SetQuestAmount", amount)
	emit_signal("QuestChange")

func BroadcastRandomizeQuests():
	emit_signal("RandomizeQuests")
	emit_signal("QuestChange")

func BroadcastStepUpdate(amount):
	emit_signal("StepUpdate", amount)
	
func BroadcastPickup():
	emit_signal("Pickup")

func BroadcastStep():
	emit_signal("Step")

func BroadcastChoseCorrectObject():
	emit_signal("ChoseCorrectObject")
