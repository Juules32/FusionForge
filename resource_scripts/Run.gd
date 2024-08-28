# -----------------------------------------------------------------------------
# Resource script for ALL state variables related to the current run.
# ----------------------------------------------------------------------------

extends ProperResource
class_name Run

@export var battle: Battle = Battle.new()
# @export var dungeon_layout: DungeonLayout
# etc...
