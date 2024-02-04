extends "res://projectiles/player_projectile.gd"

func _physics_process(delta)->void:
	._physics_process(delta)
	if Utils.brotils_has_weapon_any_tier("weapon_inhale"):
		var player = Utils.brotils_get_player()
		position = player.position
		position.y -= 10

func _on_Hitbox_hit_something(thing_hit:Node, damage_dealt:int)->void:
	._on_Hitbox_hit_something(thing_hit, damage_dealt)

func _on_Hitbox_critically_hit_something(_thing_hit:Node, _damage_dealt:int)->void:
	._on_Hitbox_critically_hit_something(_thing_hit, _damage_dealt)

func _on_Area2D_area_entered(area:Area2D)->void:
	area.attracted_by = Utils.brotils_get_player()
