# -----------------------------------------------------------------------------
# Global script managing the state.
# ----------------------------------------------------------------------------

extends Node

const save_file_dir = "user://saves/"
const save_file_name = "PlayerSave.tres"
const save_file_path = save_file_dir + save_file_name

var state: State = State.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# Generates the folders for the save file dir
	DirAccess.make_dir_absolute(save_file_dir)
	
	_load_state()

func _load_state():
	state = ResourceLoader.load(save_file_path)
	print("loaded")

func _save_state():
	ResourceSaver.save(state, save_file_path)
	print("saved")
