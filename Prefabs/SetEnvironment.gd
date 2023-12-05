extends Area3D

@export var index = 0

func Press():
	EventManager.BroadcastSetEnvironment(index)
