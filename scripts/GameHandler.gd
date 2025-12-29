extends Node

var recompte := {
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

var preus := {
	"fisica":7,
	"digital":4,
	"fis_dig":11,
	"fisfis":13,
	"fisfis_dig":16
}

func save_data():
	var save_file = FileAccess.open("res://saveData.save", FileAccess.WRITE)
	save_file.store_var(recompte)

func load_data():
	if not FileAccess.file_exists("res://saveData.save"):
		return
	var save_file = FileAccess.open("res://saveData.save", FileAccess.READ)
	recompte = save_file.get_var(true)
