extends CanvasLayer

signal start_game
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_score(score):
	$ScoreLabel.text = str(score)

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	$MessageLabel.text = "Flappy Bird"
	$MessageLabel.show()
	await get_tree().create_timer(1.0).timeout
	$Button.show()
	
func button_pressed():
	$Button.hide()
	start_game.emit()
	
func message_timer_timeout():
	$MessageLabel.hide()
	
