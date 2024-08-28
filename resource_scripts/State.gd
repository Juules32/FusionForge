# -----------------------------------------------------------------------------
# Resource script for ALL state variables that are saved and loaded.
# ----------------------------------------------------------------------------

extends ProperResource
class_name State

@export var run: Run = Run.new()
@export var options: Options = Options.new()
# @export var achievements: Array[Achievement]
# etc...
