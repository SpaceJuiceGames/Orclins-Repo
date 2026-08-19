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
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	var num: int = 0
	
	for x in range(10):
		for y in range(10):
			num = num + 1
			
			print((x),(","),(y), (": "), (noise.get_noise_2d(x,y)*100))
