extends Area2D

@export var fall_speed = 300

var screen_size

var start = false

signal fail

signal score_add

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	$AnimatedSprite2D.play("bird")
	if start:
		var velocity = Vector2(0, 1.0)
		#这里的逻辑是每按下一次，上升固定距离!!!
		if Input.is_action_pressed("fly"):
			position +=	Vector2(0, -6.0)
		position += velocity * fall_speed * delta
	
#完善小鸟动画：待机未开始时ros=0,起飞移动时ros-=PI/4,下降时ros+=PI/4，撞到时ros+=PI/4


func start_game():
	position = Vector2(216, 300)
	start = true
	show()
	$CollisionShape2D.disabled = false


func fallout(area: Area2D) -> void:
	if not area.is_in_group("ScoreArea"):
		#print("Hit")
		hide()
		fail.emit()
		$CollisionShape2D.set_deferred("disabled", true)
	else:
		score_add.emit()
	pass # Replace with function body.
