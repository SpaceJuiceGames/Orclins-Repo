extends Node2D

@onready var terrain: Node2D = $".."
var map_x = terrain.map_x
var map_y = terrain.map_y


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _draw() -> void:
	if terrain.chunk_debug == true:
		draw_line(Vector2i(-(map_x),map_y),Vector2i(map_x,map_y),Color(1.0, 0.0, 0.0, 1.0),1)
		draw_line(Vector2i(map_x,map_y),Vector2i(map_x,-(map_y)),Color(1.0, 0.0, 0.0, 1.0),1)
		draw_line(Vector2i(map_x,-(map_y)),Vector2i(-(map_x),-(map_y)),Color(1.0, 0.0, 0.0, 1.0),1)
		draw_line(Vector2i(-(map_x),-(map_y)),Vector2i(-(map_x),map_y),Color(1.0, 0.0, 0.0, 1.0),1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
