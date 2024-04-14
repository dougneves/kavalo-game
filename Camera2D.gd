extends Camera2D
@export var tile_map: TileMap
@export var cell_size: int

# Called when the node enters the scene tree for the first time.
func _ready():
	var world_rect = tile_map.get_used_rect()
	limit_left = 0
	limit_right = world_rect.size.x * cell_size;
	limit_top = 0;
	limit_bottom = world_rect.size.y * cell_size;
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
