extends Node


signal on_window_mode_seleceted(index : int)

signal on_resolution_selected(index : int)

signal set_settings_dicitonary(settings_dict: Dictionary)

func emit_set_settings_dictionary(settings_dict: Dictionary) -> void:
	set_settings_dicitonary.emit(settings_dict)

func emit_on_window_mode_seleceted(index : int) -> void:
	on_window_mode_seleceted.emit(index)
	
func emit_on_resolution_seleceted(index : int) -> void:
	on_resolution_selected.emit(index)
