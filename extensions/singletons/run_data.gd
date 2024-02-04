extends "res://singletons/run_data.gd"

func init_effects()->Dictionary:
	var custom_effects = {
		"effect_shop_items": 0
	}
	return Utils.merge_dictionaries(.init_effects(), custom_effects)
