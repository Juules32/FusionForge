# -----------------------------------------------------------------------------
# Manages which element explanation should be shown.
# ----------------------------------------------------------------------------

extends VBoxContainer

@onready var strengths_label: RichTextLabel = $StrengthsMarginContainer/StrengthsLabel
@onready var weaknesses_label: RichTextLabel = $WeaknessesMarginContainer/WeaknessesLabel

var pyro_hovered = false
var hydro_hovered = false
var earth_hovered = false
var waned_hovered = false
var hovered_element = Data.ELEMENTS.NONE

func _process(_delta: float) -> void:
	_set_hovered_element()
	_update_explanation_text()

# Uses the hovered circles to determine the appropriate element
func _set_hovered_element() -> void:
	if not waned_hovered:
		hovered_element = Data.ELEMENTS.NONE
		return
	if pyro_hovered and not hydro_hovered and not earth_hovered:
		hovered_element = Data.ELEMENTS.PYRO
		return
	if not pyro_hovered and hydro_hovered and not earth_hovered:
		hovered_element = Data.ELEMENTS.HYDRO
		return
	if not pyro_hovered and not hydro_hovered and earth_hovered:
		hovered_element = Data.ELEMENTS.EARTH
		return
	if pyro_hovered and hydro_hovered and not earth_hovered:
		hovered_element = Data.ELEMENTS.LIGHTNING
		return
	if pyro_hovered and not hydro_hovered and earth_hovered:
		hovered_element = Data.ELEMENTS.ALLOY
		return
	if not pyro_hovered and hydro_hovered and earth_hovered:
		hovered_element = Data.ELEMENTS.FLORA
		return
	if pyro_hovered and hydro_hovered and earth_hovered:
		hovered_element = Data.ELEMENTS.PRISMATIC
		return
	if not pyro_hovered and not hydro_hovered and not earth_hovered:
		hovered_element = Data.ELEMENTS.WANED
		return
	
	hovered_element = Data.ELEMENTS.NONE
	return

func _update_explanation_text() -> void:
	if hovered_element != Data.ELEMENTS.NONE:
		_set_strengths_text()
		_set_weaknesses_text()
	else:
		strengths_label.text = ""
		weaknesses_label.text = ""

func _set_strengths_text() -> void:
	var strength_description = " deals double damage and receives half damage against "
	strengths_label.text = _generate_matchup_text(strength_description, Data.element_strengths[hovered_element])

func _set_weaknesses_text() -> void:
	var weakness_description = " deals half damage and receives double damage against "
	weaknesses_label.text = _generate_matchup_text(weakness_description, Data.element_weaknesses[hovered_element])
	
func _generate_matchup_text(custom_text: String, element_names: Array) -> String:
	var generated_text: String = (
		Data.element2str[hovered_element] + 
		custom_text + 
		Data.element2str[element_names[0]]
	)
	if len(element_names) > 1:
		generated_text += " and " + Data.element2str[element_names[1]]
	generated_text += "."
	return generated_text

func _on_pyro_circle_area_mouse_entered() -> void:
	pyro_hovered = true

func _on_pyro_circle_area_mouse_exited() -> void:
	pyro_hovered = false

func _on_hydro_circle_area_mouse_entered() -> void:
	hydro_hovered = true

func _on_hydro_circle_area_mouse_exited() -> void:
	hydro_hovered = false

func _on_earth_circle_area_mouse_entered() -> void:
	earth_hovered = true

func _on_earth_circle_area_mouse_exited() -> void:
	earth_hovered = false

func _on_waned_circle_area_mouse_entered() -> void:
	waned_hovered = true

func _on_waned_circle_area_mouse_exited() -> void:
	waned_hovered = false
