extends Node2D


@export var item_type = ""
@export var item_name = ""
@export var item_texture: Texture
@export var item_effect = ""

var scene_path: String = "res://inventory/inventory_item.tscn"

@onready var icon_sprites = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if not Engine.is_editor_hint():
		icon_sprites.texture = item_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.is_editor_hint():
		icon_sprites.texture = item_texture
