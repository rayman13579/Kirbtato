extends "res://singletons/run_data.gd"

func _ready()->void:
	effect_keys_full_serialization.push_back("effect_shop_items")

func init_effects()->Dictionary:
	var custom_effects = {
		"effect_shop_items": 0
	}
	return Utils.merge_dictionaries(.init_effects(), custom_effects)
