extends Area2D

@export var dialogue_resources: DialogueResource
@export var dialogue_start: String = "start"

func action() -> void:
	if dialogue_resources == null:
		print("Error: dialogue_resources not assigned!")
		return
	DialogueManager.show_example_dialogue_balloon(dialogue_resources, dialogue_start)
