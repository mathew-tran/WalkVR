extends CSGMesh3D

@export var NewsOutlets : NewsSource
func _ready():
	EventManager.StepUpdate.connect(OnStepUpdate)
	NewsOutlets.Initialize()
		
func OnStepUpdate(amount):
	if amount % 100 == 0:
		if NewsOutlets.CanGetNews():
			$Label3D.text = NewsOutlets.GetNextNews()
			NewsOutlets.IncrementNews()
