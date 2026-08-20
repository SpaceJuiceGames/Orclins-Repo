extends Node2D

var noise = FastNoiseLite.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_noise()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func generate_noise():
	noise = FastNoiseLite.new()
	noise.seed = randf_range(0,10000)
	noise.fractal_gain = 0.2
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	var num: int = 0
	for x in range(1000):
		for y in range(150):
			var noise_value: float = (noise.get_noise_2d(x,y)* 100)
			noise_value = noise_value * ((149-y))
			var position = Vector2i(x,y)
			generate_rect(position,noise_value)
			num = num + 1

func generate_rect(pos, noise_val):
	var block = ColorRect.new()
	block.position = pos
	block.size = Vector2i(2,2)
	if pos.y >= 75:
		if noise_val >= 7:
			block.color = Color(0.0, 0.0, 0.0, 1.0)
		elif noise_val >= 3:
			block.color = Color(0.476, 0.476, 0.0, 1.0)
		else:
			block.color	 = Color(0.149, 0.0, 0.893, 1.0)
	else:
		if noise_val >= 7:
			block.color = Color(0.236, 0.159, 0.072, 1.0)
		elif noise_val >= 3:
			block.color = Color(0.163, 0.574, 0.0, 1.0)
		else:
			block.color	 = Color(0.431, 0.612, 1.0, 1.0)
	add_child(block)
