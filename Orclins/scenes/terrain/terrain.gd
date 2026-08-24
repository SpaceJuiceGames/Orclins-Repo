extends Node2D

@export var chunk_debug: bool = false
@onready var noise_gen: Node2D = $NoiseGen
@onready var tm_background: TileMapLayer = $"TM-Background"


var chunk_dimensions := Vector2i(100,-600)
var map_x:int = -(chunk_dimensions.x)
var map_y:int = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	noise_gen.generate_noise()
	tm_background.display_map()
		#var border_x = Line2D.new()
		#border_x.add_point(Vector2i(-(map_x),map_y))
		#border_x.add_point(Vector2i(map_x,map_y))
		#border_x.add_point(Vector2i(map_x,-(map_y)))
		#border_x.add_point(Vector2i(-(map_x),-(map_y)))
		#print(border_x)
	queue_redraw()
	pass

func _draw() -> void:
	if chunk_debug == true:
		draw_line(Vector2i(-(map_x),map_y),Vector2i(map_x,map_y),Color(1.0, 0.0, 0.0, 1.0),1)
		draw_line(Vector2i(map_x,map_y),Vector2i(map_x,-(map_y)),Color(1.0, 0.0, 0.0, 1.0),1)
		draw_line(Vector2i(map_x,-(map_y)),Vector2i(-(map_x),-(map_y)),Color(1.0, 0.0, 0.0, 1.0),1)
		draw_line(Vector2i(-(map_x),-(map_y)),Vector2i(-(map_x),map_y),Color(1.0, 0.0, 0.0, 1.0),1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
