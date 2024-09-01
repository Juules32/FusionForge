extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DisplayServer.window_set_mode(Game.state.options.window_mode)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
