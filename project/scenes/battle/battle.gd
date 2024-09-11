extends Control

@onready var debug_area: VBoxContainer = $DebugArea

func _ready() -> void:
	Game.window_set_mode(Game.state.options.window_mode)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("toggle_debug"):
		debug_area.visible = not debug_area.visible
	if Input.is_action_just_pressed("toggle_fullscreen"):
		var current_mode = DisplayServer.window_get_mode()
		if (current_mode == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN or 
			current_mode == DisplayServer.WINDOW_MODE_FULLSCREEN):
			Game.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			Game.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
