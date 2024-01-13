extends "res://weapons/weapon.gd"

var texture_closed
var texture_open
var cooldown_timer = 0.0
var cooldown := 0.3

func _ready()->void:
	._ready()
	texture_closed = preload("res://mods-unpacked/Rayman-Kirbtato/content/characters/Kirbtato/kirbtato_mouth_closed.png")
	texture_open = preload("res://mods-unpacked/Rayman-Kirbtato/content/characters/Kirbtato/kirbtato_mouth_open.png")

func _process(_delta:float)->void:
	._process(_delta)
	
	cooldown_timer += _delta
	var mouth = getMouth()

	if mouth:
		if _is_shooting:
			mouth.texture = texture_open
			cooldown_timer = 0.0
		elif cooldown_timer >= cooldown:
			mouth.texture = texture_closed
		
func getMouth()->Sprite:
	var player = Utils.brotils_get_player()
	for appearance in player._item_appearances:
		if "mouth" in appearance.texture.get_path():
			return appearance
	return null
