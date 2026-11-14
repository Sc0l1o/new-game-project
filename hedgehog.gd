extends AnimatedSprite2D

@onready var animatedSprite = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func playAnimation(anim: String):
	animatedSprite.play(anim)
