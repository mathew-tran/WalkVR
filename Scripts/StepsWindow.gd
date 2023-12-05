extends CSGMesh3D

var Steps = 0

func _ready():
	EventManager.Step.connect(OnStep)

func OnStep():
	Game.Steps += 1
	$Label3D.text = "Power:\n" + str(Game.Steps)
	EventManager.BroadcastStepUpdate(Game.Steps)

