extends Node2D

@onready var terrain: Node2D = $".."

@export var seed: int = 1
@export var noise_debug: bool = false

var noise = FastNoiseLite.new()
var noise_x: int = 10
var noise_y: int = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	noise_x = -(terrain.map_x)
	noise_y = -(terrain.map_y)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func generate_noise():
	print(noise_x, " x ", terrain.chunk_dimensions.x)
	print(noise_y, " y ", terrain.chunk_dimensions.y)
	noise = FastNoiseLite.new()
	noise.seed = seed
	noise.fractal_gain = 0.2
	noise.frequency = 0.005
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	var count: int =0
	while noise_x <= terrain.chunk_dimensions.x:
		while noise_y <= terrain.chunk_dimensions.y:
			var noise_value: float = (noise.get_noise_2d(noise_x,noise_y))
			var normalised_noise: float = noise_value * (terrain.chunk_dimensions.y - noise_y)
			var position = Vector2i(noise_x,noise_y)
			if normalised_noise >= 0.5:
				normalised_noise = 0
			elif normalised_noise < 0.5:
				normalised_noise = 1
			if noise_debug == true:
				generate_rect(position,normalised_noise)
			noise_y = noise_y + 16
		noise_y = -(terrain.map_y)
		noise_x = noise_x + 16

func generate_rect(pos, noise_val):
	var block = ColorRect.new()
	block.position = pos + Vector2i(16,16)
	block.size = Vector2i(16,16)
	if pos.y >= terrain.chunk_dimensions.y - 1:
		print(pos.y, " | ", terrain.chunk_dimensions.y)
		block.color = Color(1.0, 0.0, 0.0, 1.0)
	else:
		block.color = Color(noise_val,noise_val,noise_val,noise_val)
	add_child(block)
