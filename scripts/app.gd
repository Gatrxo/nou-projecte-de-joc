extends Control



func _ready() -> void:
	GameHandler.load_data()
	data = GameHandler.recompte
	recomptar()
	goToAdd()
	$Menu.visible = false
	$Menu/VBoxContainer/borrar/segur.visible = false

#=========NAVBAR==========

func goToAdd():
	$Escollir.visible = true
	$Recompte.visible = false
	$llistat.visible = false

func goToRecount():
	$Escollir.visible = false
	$Recompte.visible = true
	$llistat.visible = false

func goToList():
	$Escollir.visible = false
	$Recompte.visible = false
	$llistat.visible = true

#--------------------------

func _on_afegir_pressed() -> void:
	goToAdd()

func _on_recompte_pressed() -> void:
	goToRecount()

func _on_llistat_pressed() -> void:
	goToList()

#=========AFEGIR_COMPRES===========
var current_choose : String
var preus = GameHandler.preus

func afegirCompra(choose : String, metode : String):
	GameHandler.recompte[choose]["Venudes"] += 1
	if metode == "efectiu":
		GameHandler.recompte[choose]["Efectiu"] += 1
	elif metode == "tarjeta":
		GameHandler.recompte[choose]["Tarjeta"] += 1
	print(GameHandler.recompte)
	print("---------------------------------------------")
	GameHandler.save_data()

#---------------------------------------

func _on_fisica_pressed() -> void:
	current_choose = "fisica"
	$Escollir/Opcions.visible = false
	$Escollir/Metode.visible = true

func _on_dig_pressed() -> void:
	current_choose = "digital"
	$Escollir/Opcions.visible = false
	$Escollir/Metode.visible = true

func _on_fisdig_pressed() -> void:
	current_choose = "fis_dig"
	$Escollir/Opcions.visible = false
	$Escollir/Metode.visible = true

func _on_fisfis_pressed() -> void:
	current_choose = "fisfis"
	$Escollir/Opcions.visible = false
	$Escollir/Metode.visible = true

func _on_fisfisdig_pressed() -> void:
	current_choose = "fisfis_dig"
	$Escollir/Opcions.visible = false
	$Escollir/Metode.visible = true

func _on_cancel_pressed() -> void:
	$Escollir/Opcions.visible = true
	$Escollir/Metode.visible = false

#---------------------------------------

func _on_efectiu_pressed() -> void:
	$Escollir/Opcions.visible = true
	$Escollir/Metode.visible = false
	afegirCompra(current_choose, "efectiu")
	afegirEtiqueta(current_choose, preus[current_choose], "Efectiu")
	recomptar()

func _on_tarjeta_pressed() -> void:
	$Escollir/Opcions.visible = true
	$Escollir/Metode.visible = false
	afegirCompra(current_choose, "tarjeta")
	afegirEtiqueta(current_choose, preus[current_choose], "Tarjeta")
	recomptar()
	

#=========RECOMPTE===========
@onready var tarjetesContainer = $Recompte/tarjetes/VBoxContainer
var data : Dictionary

func recomptar():
	data = GameHandler.recompte
	#---ventes---
	#--Fisica
	tarjetesContainer.get_node("Fisica/Contingut/venudes/venudes").text = "Venudes: " + str(data["fisica"]["Venudes"])
	tarjetesContainer.get_node("Fisica/Contingut/efectiu/venudes").text = "Efectiu: " + str(data["fisica"]["Efectiu"])
	tarjetesContainer.get_node("Fisica/Contingut/tarjeta/venudes").text = "Tarjeta: " + str(data["fisica"]["Tarjeta"])

	#--Digital
	tarjetesContainer.get_node("Digital/Contingut/venudes/venudes").text = "Venudes: " + str(data["digital"]["Venudes"])
	tarjetesContainer.get_node("Digital/Contingut/efectiu/venudes").text = "Efectiu: " + str(data["digital"]["Efectiu"])
	tarjetesContainer.get_node("Digital/Contingut/tarjeta/venudes").text = "Tarjeta: " + str(data["digital"]["Tarjeta"])

	#--Fis_Dig
	tarjetesContainer.get_node("fis_dig/Contingut/venudes/venudes").text = "Venudes: " + str(data["fis_dig"]["Venudes"])
	tarjetesContainer.get_node("fis_dig/Contingut/efectiu/venudes").text = "Efectiu: " + str(data["fis_dig"]["Efectiu"])
	tarjetesContainer.get_node("fis_dig/Contingut/tarjeta/venudes").text = "Tarjeta: " + str(data["fis_dig"]["Tarjeta"])

	#--FisFis
	tarjetesContainer.get_node("fisfis/Contingut/venudes/venudes").text = "Venudes: " + str(data["fisfis"]["Venudes"])
	tarjetesContainer.get_node("fisfis/Contingut/efectiu/venudes").text = "Efectiu: " + str(data["fisfis"]["Efectiu"])
	tarjetesContainer.get_node("fisfis/Contingut/tarjeta/venudes").text = "Tarjeta: " + str(data["fisfis"]["Tarjeta"])

	#--FisFis_Dig
	tarjetesContainer.get_node("fisfis_dig/Contingut/venudes/venudes").text = "Venudes: " + str(data["fisfis_dig"]["Venudes"])
	tarjetesContainer.get_node("fisfis_dig/Contingut/efectiu/venudes").text = "Efectiu: " + str(data["fisfis_dig"]["Efectiu"])
	tarjetesContainer.get_node("fisfis_dig/Contingut/tarjeta/venudes").text = "Tarjeta: " + str(data["fisfis_dig"]["Tarjeta"])
	
	#---preus---
	#--Fisica
	tarjetesContainer.get_node("Fisica/Contingut/venudes/total").text = str(data["fisica"]["Venudes"] * 7) + "€"
	tarjetesContainer.get_node("Fisica/Contingut/efectiu/total").text = str(data["fisica"]["Efectiu"] * 7) + "€"
	tarjetesContainer.get_node("Fisica/Contingut/tarjeta/total").text = str(data["fisica"]["Tarjeta"] * 7) + "€"

	#--Digital
	tarjetesContainer.get_node("Digital/Contingut/venudes/total").text = str(data["digital"]["Venudes"] * 4) + "€"
	tarjetesContainer.get_node("Digital/Contingut/efectiu/total").text = str(data["digital"]["Efectiu"] * 4) + "€"
	tarjetesContainer.get_node("Digital/Contingut/tarjeta/total").text = str(data["digital"]["Tarjeta"] * 4) + "€"

	#--Fis_Dig
	tarjetesContainer.get_node("fis_dig/Contingut/venudes/total").text = str(data["fis_dig"]["Venudes"] * 11) + "€"
	tarjetesContainer.get_node("fis_dig/Contingut/efectiu/total").text = str(data["fis_dig"]["Efectiu"] * 11) + "€"
	tarjetesContainer.get_node("fis_dig/Contingut/tarjeta/total").text = str(data["fis_dig"]["Tarjeta"] * 11) + "€"

	#--FisFis
	tarjetesContainer.get_node("fisfis/Contingut/venudes/total").text = str(data["fisfis"]["Venudes"] * 13) + "€"
	tarjetesContainer.get_node("fisfis/Contingut/efectiu/total").text = str(data["fisfis"]["Efectiu"] * 13) + "€"
	tarjetesContainer.get_node("fisfis/Contingut/tarjeta/total").text = str(data["fisfis"]["Tarjeta"] * 13) + "€"

	#--FisFis_Dig
	tarjetesContainer.get_node("fisfis_dig/Contingut/venudes/total").text = str(data["fisfis_dig"]["Venudes"] * 16) + "€"
	tarjetesContainer.get_node("fisfis_dig/Contingut/efectiu/total").text = str(data["fisfis_dig"]["Efectiu"] * 16) + "€"
	tarjetesContainer.get_node("fisfis_dig/Contingut/tarjeta/total").text = str(data["fisfis_dig"]["Tarjeta"] * 16) + "€"

#=========LLISTAT===========

func afegirEtiqueta(choose : String, preu : int, metode : String):
	var etiqueta = preload("res://scenes/etiqueta.tscn")
	var e = etiqueta.instantiate()
	e.tipus = choose
	e.preu = preu
	e.metode = metode
	get_node("llistat/ScrollContainer/Etiquetes").add_child(e)

#=========MENU===========

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		if $Menu.visible:
			$Menu.visible = false
			$Menu/VBoxContainer/borrar/segur.visible = false
		else:
			$Menu.visible = true

func _on_sortir_pressed() -> void:
	$Menu.visible = false
	$Menu/VBoxContainer/borrar/segur.visible = false

func _on_sortir_app_pressed() -> void:
	get_tree().quit()

func _on_borrar_pressed() -> void:
	$Menu/VBoxContainer/borrar/segur.visible = true

func _on_segur_pressed() -> void:
	GameHandler.recompte = {
		"fisica": {
			"Venudes": 0,
			"Efectiu": 0,
			"Tarjeta": 0
		},
		"digital": {
			"Venudes": 0,
			"Efectiu": 0,
			"Tarjeta": 0
		},
		"fis_dig": {
			"Venudes": 0,
			"Efectiu": 0,
			"Tarjeta": 0
		},
		"fisfis": {
			"Venudes": 0,
			"Efectiu": 0,
			"Tarjeta": 0
		},
		"fisfis_dig": {
			"Venudes": 0,
			"Efectiu": 0,
			"Tarjeta": 0
		}
	}
	GameHandler.save_data()
	recomptar()
	for i in get_node("llistat/ScrollContainer/Etiquetes").get_children():
		i.queue_free()

func _on_opcions_pressed() -> void:
	if $Menu.visible:
		$Menu.visible = false
		$Menu/VBoxContainer/borrar/segur.visible = false
	else:
		$Menu.visible = true
