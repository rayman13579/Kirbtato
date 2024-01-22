extends "res://projectiles/player_projectile.gd"



func _physics_process(delta)->void:
	._physics_process(delta)
	if Utils.brotils_has_weapon_any_tier("weapon_inhale"):
		var player = Utils.brotils_get_player()
		position = player.position
		position.y -= 10
