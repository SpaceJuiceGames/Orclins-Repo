extends Node2D

@export var chunk_debug: bool = false
@onready var noise_gen: Node2D = $NoiseGen
@onready var tm_background: TileMapLayer = $"TM-Background"


var chunk_dimensions := Vector2i(200,-1000)
var map_x:int = -(chunk_dimensions.x)
var map_y:int = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#noise_gen.generate_noise()
	tm_background.display_map()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
