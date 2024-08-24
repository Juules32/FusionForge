# -----------------------------------------------------------------------------
# Resource script for ALL state variables related to cards.
# ----------------------------------------------------------------------------

extends Resource
class_name Card

@export var id: int
@export var name: String
@export var effects: Array[String]
@export var element: ElementData.ELEMENTS
