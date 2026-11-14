extends AnimatedSprite2D

var input_array = []
var canInput = false
@onready var animatedSprite = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !canInput:
		return
	elif len(input_array) == 0:
		canInput = false
		return
	
	
	playAnimation()
	

func setInput(input_list: Array[String]):
	input_array = input_array
	canInput = true

func playAnimation():
	if Input.is_action_just_pressed("press_a") && Input.is_action_just_pressed("press_d"):
		animatedSprite.play("yeah")
	# add more input maps here
