extends Node2D

@export var pipe_scene: PackedScene

var score = 0

var game_is_over = false

@export var pipe_speed = 2.0
#地板移动的速度
#var ground_mov_spd = 100

func _ready() -> void:
	#$Player.start_game()
	#print($Ground.position)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass


func _on_pipe_timer_timeout() -> void:
	#生成柱子
	var pipe = pipe_scene.instantiate()
	pipe.position = Vector2(460, randf_range(150, 350))
	#get_tree().current_scene.add_child(pipe)
	add_child(pipe)

#过柱子要计分

func game_over():
	game_is_over = true
	$GroundArea.game_is_over = true
	$PipeTimer.stop()
	$HUD.show_game_over()

#过柱子计分，
func add_score():
	score += 1
	$HUD.update_score(score)

func new_game():
	get_tree().call_group("pipes", "queue_free")
	game_is_over = false
	$GroundArea.game_is_over = false
	$Player.start_game()
	score = 0
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")

func _on_start_timer_timeout() -> void:
	if not game_is_over:
		$PipeTimer.start()
	pass # Replace with function body.
