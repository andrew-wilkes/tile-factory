extends Node2D

@export var SIZE = 32

@onready var tile_shader = preload("res://tile.gdshader")

func _ready() -> void:
	if get_parent().name == "root":
		test()


func get_tile(color: Color, centered := false) -> Sprite2D:
	var tile_image = Image.create_empty(SIZE, SIZE, false, Image.FORMAT_RGB8)
	
	var tile = Sprite2D.new()
	tile.centered = centered
	tile.texture = ImageTexture.create_from_image(tile_image)
	
	var mat = ShaderMaterial.new()
	mat.shader = tile_shader.duplicate()
	mat.set_shader_parameter("color", color)
	
	tile.material = mat
	return tile


func test():
	for x in 16:
		for y in 16:
			var tile = get_tile(Color.from_hsv(randf(), 1.0, 1.0))
			tile.position = Vector2(x, y) * SIZE * 1.2
			add_child(tile)
