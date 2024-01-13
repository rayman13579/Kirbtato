class_name RotatingShootingBehavior
extends RangedWeaponShootingBehavior


func shoot_projectile(rotation:float = _parent.rotation, knockback:Vector2 = Vector2.ZERO)->void :
	var projectile = WeaponService.spawn_projectile(rotation, 
		_parent.current_stats, 
		_parent.muzzle.global_position, 
		knockback, 
		false, 
		_parent.effects, 
		_parent
	)
	projectile.rotation = rotation

	emit_signal("projectile_shot", projectile)
