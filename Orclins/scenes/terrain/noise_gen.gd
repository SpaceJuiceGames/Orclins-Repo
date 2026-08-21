extends Node2D

@export var seed: int = 1

var noise = FastNoiseLite.new()
var chunk_dimensions := Vector2i(200,1000)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_noise()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func generate_noise():
	noise = FastNoiseLite.new()
	noise.seed = seed
	noise.fractal_gain = 0.2
	noise.frequency = 0.05
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX_SMOOTH
	var num: int = 0
	for x in range(chunk_dimensions.x):
		for y in range(chunk_dimensions.y):
			var noise_value: float = (noise.get_noise_2d(x,y))
			var normalised_noise: float = noise_value * (chunk_dimensions.y - y)
			var position = Vector2i(x,y)
			if normalised_noise < -1:
				normalised_noise = -1
			elif normalised_noise > 1:
				normalised_noise = 1
			
			generate_rect(position,normalised_noise)
			num = num + 1

func generate_rect(pos, noise_val):
	var block = ColorRect.new()
	block.position = pos
	block.size = Vector2i(2,2)
	#if pos.y >= height/2:
		#if noise_val >= 0.07:
			#block.color = Color(0.0, 0.0, 0.0, 1.0)
		#elif noise_val >= 0.03:
			#block.color = Color(0.476, 0.476, 0.0, 1.0)
		#else:
			#block.color	 = Color(0.149, 0.0, 0.893, 1.0)
	#else:
		#if noise_val >= 0.07:
			#block.color = Color(0.236, 0.159, 0.072, 1.0)
		#elif noise_val >= 0.05:
			#block.color = Color(0.163, 0.574, 0.0, 1.0)
		#else:
			#block.color	 = Color(0.431, 0.612, 1.0, 1.0)
	if pos.y >= chunk_dimensions.y - 1:
		block.color = Color(1.0, 0.0, 0.0, 1.0)
	else:
		block.color = Color(noise_val*255,noise_val*255,noise_val*255,1)
	add_child(block)
