extends TileMapLayer

@onready var tm_background: TileMapLayer = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var atlas_id:int = 1
	var atlas_coords:= Vector2i(1,0)
	var map_x:int = -200
	var map_y:int = 200
	var map_coords:= Vector2i(map_x,map_y)
	var randx: int = randi_range(0,3)
	var randy: int = randi_range(1,3)
	print(map_coords)
	
	while map_x < 200:
		while map_y > -200:
			randx= randi_range(0,3)
			randy= randi_range(1,3)
			atlas_coords= Vector2i(randy,randx)
			tm_background.set_cell(map_coords,atlas_id,atlas_coords)
			map_y = map_y -1
			map_coords= Vector2i(map_x,map_y)
		map_y= 200
		randx= randi_range(0,3)
		randy= randi_range(1,3)
		atlas_coords= Vector2i(randy,randx)
		tm_background.set_cell(map_coords,atlas_id,atlas_coords)
		map_x = map_x +1
		map_coords= Vector2i(map_x,map_y)
		




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
