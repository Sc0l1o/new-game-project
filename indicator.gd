extends Node2D

@onready var firstKey = $Instruction1
@onready var secondKey = $Instruction2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func setKeys(inputs: Array) -> void:
	firstKey.play(inputs[0])
	secondKey.play(inputs[1])
