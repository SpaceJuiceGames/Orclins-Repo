extends Node2D

@export var chunk_debug: bool = false
@onready var noise_gen: Node2D = $NoiseGen
@onready var tm_background: TileMapLayer = $"TM-Background"


var chunk_dimensions := Vector2i(200,4000)
var map_x:int = chunk_dimensions.x
var map_y:int = chunk_dimensions.y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(map_x)
	noise_gen.generate_noise()
	tm_background.display_map()
	queue_redraw()
	pass

func _process(delta: float) -> void:
	pass
