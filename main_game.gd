extends Node2D

@onready var pointsLabel = $Control/CenterContainer/VBoxContainer/points
var score = 0

var combos = {
	"L_Diag": {
		"inputs": ["a", "d"], # list of keys 
		"points": 10,
		"animation": "L_Diag" #animation name 
	},
	"R_Diag": {
		"inputs": ["a","j"],
		"points": 10,
		"animation": "R_Diag"
	},
	"russ": {
		"inputs": ["a","d","k"],
		"points": 50,
		"animation": "russ"
	},
	"B_Diag": {
		"inputs": ["a","d","j"],
		"points": 25,
		"animation": "B_Diag"
	},
	"R_Ball": {
		"inputs": ["s","j"],
		"points": 10,
		"animation": "R_Ball"
	},
	"L_Ball": {
		"inputs": ["s","d"],
		"points": 10,
		"animation": "L_Ball"
	},
	"T_Ball": {
		"inputs": ["s","j","d"],
		"points": 25,
		"animation": "T_Ball"
	},
	"Bounce_Back!": {
		"inputs": ["a","s","d","j","k","l"],
		"points": 100,
		"animation": "Bounce_Back!"
	},
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

	elif Input.is_action_just_pressed("press_a") and Input.is_action_just_pressed("press_j"):
		execute_combo("R_Diag")

	elif Input.is_action_just_pressed("press_k") and Input.is_action_just_pressed("press_d") and Input.is_action_just_pressed("press_j"):
		execute_combo("russ")

	elif Input.is_action_just_pressed("press_a") and Input.is_action_just_pressed("press_d") and Input.is_action_just_pressed("press_j"):
		execute_combo("B_Diag")

	elif Input.is_action_just_pressed("press_s") and Input.is_action_just_pressed("press_j"):
		execute_combo("R_Ball")

	elif Input.is_action_just_pressed("press_s") and Input.is_action_just_pressed("press_d"):
		execute_combo("L_Ball")

	elif Input.is_action_just_pressed("press_s") and Input.is_action_just_pressed("press_d") and Input.is_action_just_pressed("press_j"):
		execute_combo("T_Ball")

	elif Input.is_action_just_pressed("press_a") and Input.is_action_just_pressed("press_s") and Input.is_action_just_pressed("press_d") and Input.is_action_just_pressed("press_j") and Input.is_action_just_pressed("press_k") and Input.is_action_just_pressed("press_j"):
		execute_combo("Bounce_Back!")

func execute_combo(combo_name: String):
	if not combos.has(combo_name):
		return

	var combo = combos[combo_name]

	score += combo["points"]
	pointsLabel.text = "Score: " + str(score)

	character.play_animation(combo["animation"])
