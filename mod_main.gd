extends Node


const LOG_NAME := "Rayman-Kirbtato"

var mod_dir := ""
var ext_dir := ""
var cont_dir := ""
var trans_dir := ""

func _init() -> void:
	mod_dir = ModLoaderMod.get_unpacked_dir().plus_file(LOG_NAME)
	ext_dir = mod_dir + "/extensions/"
	cont_dir = mod_dir + "/content_data/"
	trans_dir = mod_dir + "/translations/"
	
	#change player sprite
	ModLoaderMod.install_script_extension(ext_dir + "entities/units/player/player.gd")
	#reverse weapon knockback - inhaling
	#set projectile position to mouth
	ModLoaderMod.install_script_extension(ext_dir + "projectiles/player_projectile.gd")
	#open mouth while shooting
	ModLoaderMod.install_script_extension(ext_dir + "weapons/weapon.gd")
	#limit shop to items
	ModLoaderMod.install_script_extension(ext_dir + "singletons/item_service.gd")
	#add custom effects
	ModLoaderMod.install_script_extension(ext_dir + "singletons/run_data.gd")
	
	
	ModLoaderMod.add_translation(trans_dir + "kirbtato.en.translation")


func _ready() -> void:
	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")
	ContentLoader.load_data(cont_dir + "kirbtato_characters.tres", LOG_NAME)
	ContentLoader.load_data(cont_dir + "kirbtato_weapons.tres", LOG_NAME)
	ModLoaderLog.info("Ready!", LOG_NAME)
