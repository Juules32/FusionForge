# -----------------------------------------------------------------------------
# Global script managing the state.
# ----------------------------------------------------------------------------

extends Node

const _save_file_dir = "user://saves/"
const _save_file_name = "save.tres"
const _save_file_path = _save_file_dir + _save_file_name

var state: State = State.new()

func _ready() -> void:
	
	# Generates the folders for the save file dir
	DirAccess.make_dir_absolute(_save_file_dir)
	
	load_state()

func load_state():
	if ResourceLoader.exists(_save_file_path):
		# "duplicate(true)" Makes a deep copy of the save data.
		state = ResourceLoader.load(_save_file_path).proper_duplicate(true)
		print("Loaded game from: " + _save_file_path)
	else:
		print("Could not load; no save found!")

func save_state():
	ResourceSaver.save(state, _save_file_path)
	print("Saved game to: " + _save_file_path)
