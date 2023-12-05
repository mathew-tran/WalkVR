extends Label3D

var Quests
var Index = 0
var MaxQuestAmount = 10

var CurrentQuest = null

func _ready():
	await get_tree().create_timer(.1).timeout
	
	InitQuests()
	FindQuest()
	EventManager.ChoseCorrectObject.connect(FindQuest)
	EventManager.RandomizeQuests.connect(RandomizeQuests)
	EventManager.SetQuestAmount.connect(SetQuestAmount)
	SetQuestAmount(Game.QuestAmount)
	
func SetQuestAmount(amount):
	Index = 0
	if amount == -1:
		amount = len(Quests)
	MaxQuestAmount = amount
	Game.QuestAmount = amount
	FindQuest()
	
func RandomizeQuests():
	Index = 0
	InitQuests()
	FindQuest()
	
func InitQuests():
	Quests = get_tree().get_nodes_in_group("FindMe")
	Quests.shuffle()
	
func FindQuest():
	if Index < MaxQuestAmount:
		text = Quests[Index].GetFindText()
		text += "\n\n"  + str(Index + 1) + "/" + str(MaxQuestAmount)
		Game.SetCurrentQuest(Quests[Index])
		Index += 1
	else:
		text = "You completed all the quests!"
		Game.SetCurrentQuest(null)
