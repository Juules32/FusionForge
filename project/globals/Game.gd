# -----------------------------------------------------------------------------
# Global script managing the state.
# ----------------------------------------------------------------------------

extends Node

const _save_file_dir = "user://saves/"
const _save_file_name = "save.tres"
const _save_file_path = _save_file_dir + _save_file_name

var state: State = State.new()

signal card_drawn(drawn_card: Card)

func _ready() -> void:
	Game.load_state()

func draw_card() -> void:
	if len(Game.state.run.battle.deck) > 0:
		# Remove card from deck
		var drawn_card = Game.state.run.battle.deck[randi() % len(Game.state.run.battle.deck)]
		# ...
		
		# Add card to hand
		Game.state.run.battle.hand.append(drawn_card)
		
		emit_signal("card_drawn", drawn_card)
	else:
		print("No cards in deck")

func load_state():
	DirAccess.make_dir_absolute(_save_file_dir)
	if ResourceLoader.exists(_save_file_path):
		# "duplicate(true)" Makes a deep copy of the save data.
		state = ResourceLoader.load(_save_file_path).proper_duplicate(true)
		print("Loaded game from: " + _save_file_path)
	else:
		print("Could not load; no save found!")

func save_state():
	ResourceSaver.save(state, _save_file_path)
	print("Saved game to: " + _save_file_path)
	
func window_set_mode(window_mode: DisplayServer.WindowMode):
	Game.state.options.window_mode = window_mode
	DisplayServer.window_set_mode(window_mode)
