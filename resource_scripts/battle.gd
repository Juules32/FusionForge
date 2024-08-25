# -----------------------------------------------------------------------------
# Resource script for ALL state variables related to the current battle.
# ----------------------------------------------------------------------------

extends Resource
class_name Battle

@export var deck: Array[Card]
@export var hand: Array[Card]
# @export var enemies: Array[Enemy]
# etc...

# Maybe make draw card here? Which emits signal for visuals to update?
