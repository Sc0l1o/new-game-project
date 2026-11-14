extends Node2D

@onready var pointsLabel = $Control/CenterContainer/VBoxContainer/points
@onready var tutorialLabel = $Control/CenterContainer/VBoxContainer/tutText
signal input_recieved

var introDialogue = [
	"Your goal is to help David put on the best performance possible!",
	"Below are your points. Try to get as many as possible before time's up!",
	"Let's bounce and dance!"
]

var combos = {
	"left_ballet": {
		"inputs": ["left"],
		"points": 10,
		"animation": "ballet_left"
	},
	"right_ballet": {
		"inputs": ["right"],
		"points": 10,
		"animation": "ballet_right"
	},
	"kazachok": {
		"inputs": ["left", "right"],
		"points": 25,
		"animation": "special_combo"
	}
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for text: String in introDialogue:
		await input_recieved
		tutorialLabel.text = text
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		input_recieved.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
