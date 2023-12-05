extends Area3D

@export var Amount = 2

func Press():
	EventManager.BroadcastSetQuestAmount(Amount)
