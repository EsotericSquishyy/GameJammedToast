extends Camera2D

const DEFAULT_ZOOM = 4
@export var tilemap: TileMap
var level_size: Vector2
var player: Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
    player = self.get_tree().root.get_child(0).player
    level_size = get_tilemap_size()
    # set_anchor_mode(Camera2D.ANCHOR_MODE_FIXED_TOP_LEFT)
    var zoom_val = max(get_tilemap_zoom(), DEFAULT_ZOOM)

    set_zoom(Vector2(zoom_val, zoom_val))



func get_tilemap_zoom():
    var viewport_size = get_viewport().size

    var viewport_aspect = float(viewport_size[0]) / float(viewport_size[1])
    var level_aspect = float(level_size.x) / float(level_size.y)
    var new_zoom = 1.0

    if level_aspect > viewport_aspect:
        new_zoom = float(viewport_size[1]) / level_size.y
    else:
        new_zoom = float(viewport_size[0]) / level_size.x

    return new_zoom



func get_tilemap_size():
    var tile_size = tilemap.get_tileset().tile_size
    var tilemap_rect = tilemap.get_used_rect()
    var tilemap_size = Vector2i(
        tilemap_rect.end.x - tilemap_rect.position.x,
        tilemap_rect.end.y - tilemap_rect.position.y
    )

    return tilemap_size * tile_size
