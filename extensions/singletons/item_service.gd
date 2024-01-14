extends "res://singletons/item_service.gd"

func get_shop_items(wave:int, number:int = NB_SHOP_ITEMS, prev_items:Array = [], locked_items:Array = [])->Array:
	if Utils.brotils_current_character_is("character_kirbtato"):
		var new_items: = []
		for i in number:
			var excluded_items = prev_items + new_items
			var new_item = get_rand_item_for_wave(wave, TierData.ITEMS, excluded_items, RunData.items)
			new_items.push_back([new_item, wave])
		
		return new_items
	else:
		return .get_shop_items(wave, number, prev_items, locked_items)
