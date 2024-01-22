class_name RotatingShootingBehavior
extends RangedWeaponShootingBehavior

var count = 0
var scene1
var scene2
var scene3
var scene4

var cooldown_timer = 0.0
var mouth_texture_closed
var mouth_texture_open

var sound_timer = 0.0
var sound_start
var sound_loop

func _ready()->void:
	scene1 = preload("res://mods-unpacked/Rayman-Kirbtato/content/projectiles/air/air_projectile_1.tscn")
	scene2 = preload("res://mods-unpacked/Rayman-Kirbtato/content/projectiles/air/air_projectile_2.tscn")
	scene3 = preload("res://mods-unpacked/Rayman-Kirbtato/content/projectiles/air/air_projectile_3.tscn")
	scene4 = preload("res://mods-unpacked/Rayman-Kirbtato/content/projectiles/air/air_projectile_4.tscn")
	mouth_texture_closed = preload("res://mods-unpacked/Rayman-Kirbtato/content/characters/Kirbtato/kirbtato_mouth_closed.png")
	mouth_texture_open = preload("res://mods-unpacked/Rayman-Kirbtato/content/characters/Kirbtato/kirbtato_mouth_open.png")
	sound_start = preload("res://mods-unpacked/Rayman-Kirbtato/content/weapons/ranged/inhale/inhale_start.wav")
	sound_loop = preload("res://mods-unpacked/Rayman-Kirbtato/content/weapons/ranged/inhale/inhale_loop.wav")


func _process(_delta:float)->void:
	sound_timer += _delta
	cooldown_timer += _delta
	var mouth = getMouth()
	
	if _parent._is_shooting and sound_timer >= 0.15:
		var sound_to_play = sound_loop if mouth.texture == mouth_texture_open else sound_start
		SoundManager.play(sound_to_play, _parent.current_stats.sound_db_mod)
		sound_timer = 0

	if mouth:
		if _parent._is_shooting:
			mouth.texture = mouth_texture_open
			cooldown_timer = 0.0
		elif cooldown_timer >= 0.3:
			mouth.texture = mouth_texture_closed
		
func getMouth()->Sprite:
	var player = Utils.brotils_get_player()
	for appearance in player._item_appearances:
		if "mouth" in appearance.texture.get_path():
			return appearance
	return null

func shoot_projectile(rotation:float = _parent.rotation, knockback:Vector2 = Vector2.ZERO)->void :
	var new_stats = _parent.current_stats.duplicate()
	new_stats.projectile_scene = getCurrentScene()
	count += 1

	var projectile = WeaponService.spawn_projectile(rotation, 
		new_stats, 
		_parent.muzzle.global_position, 
		-knockback,
		false, 
		_parent.effects, 
		_parent
	)
	projectile.rotation = rotation

	var stat_range = Utils.get_stat("stat_range")
	if stat_range > 0:
		projectile.scale = projectile.scale * (1 + min(stat_range, 300) / 100)
	if stat_range < 0:
		projectile.scale = projectile.scale * max((1 + stat_range / 100), 0.2)

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
