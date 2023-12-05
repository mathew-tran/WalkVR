extends Resource

class_name NewsSource

@export var TextPath : String

var Text = ""

var ConvertedText = []

var index = 0

func GetBookPath():
	return "res://Resources/Books/" + TextPath
	
func ReadToText():
	var file = FileAccess.file_exists(GetBookPath())
	if file:
		var openedFile = FileAccess.open(GetBookPath(), FileAccess.READ)
		Text = openedFile.get_as_text()
		openedFile.close()
	
func Initialize():
	ReadToText()
	var result = []
	var start = 0
	var end = 0
	var text_length = Text.length()

	while start < text_length:
		end = start + 500  # 150 characters limit
		if end > text_length:
			end = text_length
		else:
			while end > start and Text[end] != ' ':
				end -= 1

			var substring = Text.substr(start, end - start).strip_edges()
			result.append(substring)

		start = end + 1  # Skip the space
		
	ConvertedText = result
	
func CanGetNews():
	return index < len(ConvertedText)
	
func GetNextNews():
	return ConvertedText[index]

func IncrementNews():
	index += 1
