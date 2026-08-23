extends TileMapLayer

@onready var terrain: Node2D = $".."

@onready var tm_background: TileMapLayer = $"."
@export var emptiness: float = 0.8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var atlas_id:int = 0
	var atlas_coords:= Vector2i(0,0)
	var map_x:int = -(terrain.chunk_dimensions.x)
	var map_y:int = 200
	var map_coords:= Vector2i(map_x,map_y)
	var randx: int = randi_range(0,3)
	var randy: int = randi_range(0,3)
	print("x: ", map_x, " | ", terrain.chunk_dimensions.x)
	print("y: ", map_y, " | ", terrain.chunk_dimensions.y)

	
	while map_x < terrain.chunk_dimensions.x:
		while map_y > terrain.chunk_dimensions.y:
			var rng:float = randf()
			if rng >= emptiness:
				randx= randi_range(0,3)
				randy= randi_range(0,3)
				atlas_coords= Vector2i(randy,randx)
				tm_background.set_cell(map_coords,atlas_id,atlas_coords)
			else:
				atlas_coords= Vector2i(3,3)
				tm_background.set_cell(map_coords,atlas_id,atlas_coords)
			map_y = map_y -1
			map_coords= Vector2i(map_x,map_y)
		map_y= 200
		randx= randi_range(0,3)
		randy= randi_range(0,3)
		atlas_coords= Vector2i(randy,randx)
		tm_background.set_cell(map_coords,atlas_id,atlas_coords)
		map_x = map_x + 1
		map_coords= Vector2i(map_x,map_y)
		




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
