extends WorldEnvironment

enum ENV_TYPE {
	NIGHT,
	NIGHT_FOGGY,
	MORNING
}

@export var NightEnvironment : Environment
@export var NightFoggyEnvironment : Environment
@export var MorningEnvironment : Environment

func _ready():
	var result = randi() % len(ENV_TYPE.keys())
	if result == 0:
		environment = NightEnvironment
	elif result == 1:
		environment = NightFoggyEnvironment
	elif result == 2:
		environment = MorningEnvironment
		
	EventManager.SetEnvironment.connect(OnSetEnvironment)
	
	
func OnSetEnvironment(index):
	if index == 0:
		environment = MorningEnvironment
	if index == 1:
		environment = NightEnvironment
	if index== 2:
		environment = NightFoggyEnvironment
		
