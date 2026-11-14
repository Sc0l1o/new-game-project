extends Node2D

@onready var pointsLabel = $Control/CenterContainer/VBoxContainer/points
var score = 0

var combos = {
	"L_Diag": {
		"inputs": ["press_a", "press_d"], # list of keys 
		"points": 10,
		"animation": "ballet_left" #animation name 
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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_inputs():
	# Check simultaneous inputs first
	if Input.is_action_just_pressed("press_a") and Input.is_action_pressed("press_d"):
		execute_combo("L_Diag")

	elif Input.is_action_just_pressed("left"):
		execute_combo("left")

	elif Input.is_action_just_pressed("right"):
		execute_combo("right")


func execute_combo(combo_name: String):
	if not combos.has(combo_name):
		return

	var combo = combos[combo_name]

	score += combo["points"]
	pointsLabel.text = "Score: " + str(score)

	character.play_animation(combo["animation"])
