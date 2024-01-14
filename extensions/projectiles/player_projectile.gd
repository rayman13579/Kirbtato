extends "res://projectiles/player_projectile.gd"


func set_knockback_vector(knockback_direction:Vector2, knockback_amount:float)->void :
	if Utils.brotils_has_weapon_any_tier("weapon_inhale"):
		.set_knockback_vector(-knockback_direction, knockback_amount)

func _physics_process(delta)->void:
	._physics_process(delta)
	if Utils.brotils_has_weapon_any_tier("weapon_inhale"):
#		var player = Utils.brotils_get_player()
#		position = player.position
#		position.y -= 10
	
