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
	var rng_num: int = randi_range(0,9)
	atlas_coords= Vector2i(2,0) #stone block
	while map_y < 200:
		while map_x <200:
			rng_num = randi_range(-100,99)
			if rng_num >= 40 and rng_num <= 60 and map_y > 10:
				atlas_coords = Vector2i(3,0) #coal
				tm_terrain.set_cell(map_coords,atlas_id,atlas_coords)
				map_x = map_x +1
				map_coords= Vector2i(map_x,map_y)
			elif rng_num >= 61 and rng_num <= 75 and map_y > 20:
				atlas_coords = Vector2i(2,1) #iron
				tm_terrain.set_cell(map_coords,atlas_id,atlas_coords)
				map_x = map_x +1
				map_coords= Vector2i(map_x,map_y)
			elif rng_num >=76  and map_y > 30:
				print(map_y)
				atlas_coords = Vector2i(3,1) #copper
				tm_terrain.set_cell(map_coords,atlas_id,atlas_coords)
				map_x = map_x +1
				map_coords= Vector2i(map_x,map_y)
			else:
				atlas_coords = Vector2i(2,0)
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
