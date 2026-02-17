extends Node2D

var money: int = 0
var moneyperclick: int = 1

@onready var moneycount: RichTextLabel = $MONEYCOUNT
@onready var button := $TextureButton

var base_scale: Vector2
var base_position: Vector2

func _ready():
	base_position = moneycount.position
	base_scale = moneycount.scale

func _on_texture_button_pressed() -> void:
	money += moneyperclick
	pop_label()
	
	
func _process(delta: float) -> void:
	moneycount.text = "$" + str(money)



func pop_label():
	moneycount.position = base_position

	var tween := create_tween()
	# Small subtle upward bounce
	tween.tween_property(moneycount, "position:y", base_position.y - 3, 0.06)
	tween.tween_property(moneycount, "position:y", base_position.y, 0.06)
