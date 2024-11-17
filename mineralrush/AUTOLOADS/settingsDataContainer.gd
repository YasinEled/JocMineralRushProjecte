extends Node
var window_mode_index : int = 0
var resolution_index : int = 0

func _ready():
	pass

func on_window_mode_selected(index : int) -> void:
	pass

func handle_signals() -> void:
	SettingSignalBus.on_resolution_seleceted.connect(on_window_mode_selected())
const SettingSignalBus = preload("res://AUTOLOADS/SettingSignalBus.gd")
