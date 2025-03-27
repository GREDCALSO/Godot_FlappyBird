extends Area2D

var ground_mov_spd = 100

var game_is_over = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print($Ground.position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not game_is_over:
		$Ground.position += Vector2(-1.0, 0.0) * ground_mov_spd * delta
		#等距36px
		if $Ground.position.x <= 108:
			$Ground.position.x += 291
		return
	pass
