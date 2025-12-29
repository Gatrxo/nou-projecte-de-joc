extends Panel


var tipus : String
var preu : int
var metode : String


func _ready() -> void:
	$HBoxContainer/Tipus.text = "+1 " + tipus
	$HBoxContainer/preu.text = "+ " + str(preu) + "€"
	$HBoxContainer/metode.text = metode


func _on_borrar_pressed() -> void:
	GameHandler.recompte[tipus]["Venudes"] -= 1
	GameHandler.recompte[tipus][metode] -= 1
	get_tree().root.get_node("App").recomptar()
	queue_free()
