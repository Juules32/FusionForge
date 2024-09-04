# -----------------------------------------------------------------------------
# Resource script for ALL state variables related to the current battle.
# ----------------------------------------------------------------------------

extends ProperResource
class_name Battle

@export var deck: Array[Card]
@export var hand: Array[Card]
@export var enemies: Array[Enemy]
@export var player: Player = Player.new()
# etc...
