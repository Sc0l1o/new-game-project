extends Node2D

@onready var pointsLabel = $Control/VBoxContainer/points
@onready var tutorialLabel = $Control/VBoxContainer/tutText
var inputAllowed = false 
signal input_recieved

var introDialogue = [
	"Your goal is to help Daven put on the best performance possible!",
	"Below are your points. Try to get as many as possible before time's up!",
	"Let's bounce and dance! Press A and D at the same time."
]

var combos = {
	"Diag": {
		"inputs": ["a", "d"], # list of keys 
		"points": 10,
		"animation": "Diag" #animation name 
	}
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for text: String in introDialogue:
		print(text)
		await input_recieved
		tutorialLabel.text = text
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		input_recieved.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !inputAllowed:
		return
	if Input.is_action_just_pressed("press_a") and Input.is_action_pressed("press_d"):
		execute_combo("Diag")
