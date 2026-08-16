extends TileMapLayer

@onready var tm_terrain: TileMapLayer = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var atlas_id:int = 0
	var atlas_coords:= Vector2i(1,0)
	var map_x:int = -200
	var map_y:int = 0
	var map_coords:= Vector2i(map_x,map_y)
	while map_x < 200:
		atlas_coords= Vector2i(1,0) #grass block
		tm_terrain.set_cell(map_coords,atlas_id,atlas_coords)
		map_x = map_x +1
		map_coords= Vector2i(map_x,map_y)
	map_x = -200
	map_y = 1
	
	atlas_coords= Vector2i(0,0) #dirt block
	while map_y < 4:
		while map_x < 200:
			tm_terrain.set_cell(map_coords,atlas_id,atlas_coords)
			map_x = map_x +1
			map_coords= Vector2i(map_x,map_y)
		map_x = -200
		tm_terrain.set_cell(map_coords,atlas_id,atlas_coords)
		map_y = map_y + 1
		map_coords= Vector2i(map_x,map_y)
	map_x = -200
	map_y = 4
	
	atlas_coords= Vector2i(2,0)
	while map_y < 200:
		while map_x <200:
			tm_terrain.set_cell(map_coords,atlas_id,atlas_coords)
			map_x = map_x +1
			map_coords= Vector2i(map_x,map_y)
		map_x = -200
		tm_terrain.set_cell(map_coords,atlas_id,atlas_coords)
		map_y = map_y + 1
		map_coords= Vector2i(map_x,map_y)		
	
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
