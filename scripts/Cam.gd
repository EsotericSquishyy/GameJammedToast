extends Camera2D


@export var tilemap: TileMap
# Called when the node enters the scene tree for the first time.
func _ready():
    set_anchor_mode(Camera2D.ANCHOR_MODE_FIXED_TOP_LEFT)
    var zoom_vector = get_tilemap_zoom()

    set_zoom(zoom_vector)
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass


func get_tilemap_zoom():
    var viewport_size = get_viewport().size
    var tilemap_info = get_tilemap_info()

    var level_size = Vector2i(tilemap_info.tile_size * tilemap_info.size)

    var viewport_aspect = float(viewport_size[0]) / float(viewport_size[1])
    var level_aspect = float(level_size.x) / float(level_size.y)

    var new_zoom = 1.0

    if level_aspect > viewport_aspect:
        new_zoom = float(viewport_size[1]) / level_size.y
        print(viewport_size[1], level_size.y)
    else:
        new_zoom = float(viewport_size[0]) / level_size.x

    print(new_zoom)

    return Vector2(new_zoom, new_zoom)


func get_tilemap_info():
    var tile_size = tilemap.get_tileset().tile_size
    var tilemap_rect = tilemap.get_used_rect()
    var tilemap_size = Vector2i(
        tilemap_rect.end.x - tilemap_rect.position.x,
        tilemap_rect.end.y - tilemap_rect.position.y
    )

    print(tilemap_size, tile_size)
    print(tilemap_size * tile_size)
    return {"size": tilemap_size, "tile_size": tile_size}
