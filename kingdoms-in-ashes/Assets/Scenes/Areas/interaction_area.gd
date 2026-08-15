extends Area2D
@export var dialogue_resource: DialogueResource
@export var start_title: String = "act_1"
var player_in_range := false
@onready var coccinella = get_parent()

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.name == "Shiloh":
		player_in_range = true
		coccinella.is_paused = true

func _on_body_exited(body):
	if body.name == "Shiloh":
		player_in_range = false
		coccinella.is_paused = false

func _unhandled_input(event):
	if player_in_range and event.is_action_pressed("ui_accept"):
		"""
		Pause only Tiles, movingTiles, and Characters
		get_tree().root.get_node("Area1/Tiles").process_mode = Node.PROCESS_MODE_DISABLED
		get_tree().root.get_node("Area1/movingTiles").process_mode = Node.PROCESS_MODE_DISABLED
		get_tree().root.get_node("Area1/Characters").process_mode = Node.PROCESS_MODE_DISABLED
		"""
		DialogueManager.show_dialogue_balloon(dialogue_resource, start_title)
		
	
