extends Area2D

@export var speed = 150

var game_is_over = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#position = Vector2(400, 300)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#写移动逻辑，在main里写生成逻辑
	if not game_is_over:
		position += speed * delta * Vector2(-1, 0)

func Delete() -> void:
	queue_free()
	pass # Replace with function body.
