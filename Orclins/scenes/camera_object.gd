extends AnimatableBody2D

@onready var camera_2d: Camera2D = $Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Camera2D.zoom.x = 4
	$Camera2D.zoom.y = 4


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camera_move()
	
func camera_move():
	if Input.is_action_pressed("ui_right"):
		position.x += 10
	if Input.is_action_pressed("ui_left"):
		position.x -= 10
	if Input.is_action_pressed("ui_down"):
		position.y += 10
	if Input.is_action_pressed("ui_up"):
		position.y -= 10
	if Input.is_action_pressed("zoom in") and $Camera2D.zoom.x < 8:
		$Camera2D.zoom.x += 0.1
		$Camera2D.zoom.y += 0.1
	if Input.is_action_pressed("zoom out") and $Camera2D.zoom.x > 2:
		$Camera2D.zoom.x -= 0.1
		$Camera2D.zoom.y -= 0.1
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print(get_global_mouse_position())
		
