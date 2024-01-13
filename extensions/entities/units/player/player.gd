extends "res://entities/units/player/player.gd"


func apply_items_effects()->void:
	.apply_items_effects()

	if RunData.current_character.my_id == "character_kirbtato":
		for child in _sprites:
			if child.name == "Sprite":
				child.texture = preload("res://mods-unpacked/Rayman-Kirbtato/content/characters/Kirbtato/sprites/kirbtato_body.png")
				break

		for leg in _legs.get_children():
			leg.get_child(0).texture = preload("res://mods-unpacked/Rayman-Kirbtato/content/characters/Kirbtato/sprites/kirbtato_legs.png")
