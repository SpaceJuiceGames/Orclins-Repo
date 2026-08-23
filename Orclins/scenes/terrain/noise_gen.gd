extends Node2D

@onready var terrain: Node2D = $"terrain"

@export var seed: int = 1
@export var noise_debug: bool = false
 
var noise = FastNoiseLite.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_noise()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func generate_noise():
	noise = FastNoiseLite.new()
	noise.seed = seed
	noise.fractal_gain = 0.5
	noise.frequency = 0.005
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	var num: int = 0
	for x in range($"..".chunk_dimensions.x):
		for y in range($"..".chunk_dimensions.y):
			var noise_value: float = (noise.get_noise_2d(x,y))
			var normalised_noise: float = noise_value * ($"..".chunk_dimensions.y - y)
			var position = Vector2i(x,y)
			if normalised_noise < -1:
				normalised_noise = -1
			elif normalised_noise > 1:
				normalised_noise = 1
			if noise_debug == true:
				generate_rect(position,normalised_noise)
			num = num + 1

func generate_rect(pos, noise_val):
	var block = ColorRect.new()
	block.position = pos + Vector2i(16,16)
	block.size = Vector2i(2,2)
	if pos.y >= $"..".chunk_dimensions.y - 1:
		block.color = Color(1.0, 0.0, 0.0, 1.0)
	else:
		block.color = Color(noise_val*255,noise_val*255,noise_val*255,noise_val*255)
	add_child(block)
