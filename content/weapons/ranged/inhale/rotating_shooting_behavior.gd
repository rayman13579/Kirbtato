class_name RotatingShootingBehavior
extends RangedWeaponShootingBehavior

var count := 0
var scene1
var scene2
var scene3
var scene4

func _ready()->void:
	ModLoaderLog.info("Ready", "Rayman-Kirbtato")
	scene1 = preload("res://mods-unpacked/Rayman-Kirbtato/content/projectiles/air/air_projectile_1.tscn")
	scene2 = preload("res://mods-unpacked/Rayman-Kirbtato/content/projectiles/air/air_projectile_2.tscn")
	scene3 = preload("res://mods-unpacked/Rayman-Kirbtato/content/projectiles/air/air_projectile_3.tscn")
	scene4 = preload("res://mods-unpacked/Rayman-Kirbtato/content/projectiles/air/air_projectile_4.tscn")


func shoot_projectile(rotation:float = _parent.rotation, knockback:Vector2 = Vector2.ZERO)->void :
	var new_stats = _parent.current_stats.duplicate()
	new_stats.projectile_scene = getCurrentScene()
	count += 1

	var projectile = WeaponService.spawn_projectile(rotation, 
		new_stats, 
		_parent.muzzle.global_position, 
		knockback,
		false, 
		_parent.effects, 
		_parent
	)
	projectile.rotation = rotation

	emit_signal("projectile_shot", projectile)

func getCurrentScene()->PackedScene:
	match count % 4:
		0:
			return scene1
		1:
			return scene2
		2:
			return scene3
		3:
			return scene4
		_:
			return scene1
			
