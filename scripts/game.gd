extends Node2D

var money: int = 0
var moneyperclick: int = 1
var moneypersec: int = 0
var displayed_money: int = 0


var bought1 = false
var bought2 = false
var bought3 = false
var bought4 = false
var bought5 = false
@onready var moneycount: RichTextLabel = $MONEYCOUNT
@onready var button := $TextureButton
@onready var money_per_sec_label: RichTextLabel = $MONEY_PER_SEC

var base_scale: Vector2
var base_position: Vector2

func _ready():

	base_position = moneycount.position
	base_scale = moneycount.scale

func _on_texture_button_pressed() -> void:
	money += moneyperclick
	pop_label()
	
func _process(_delta: float) -> void:
	if displayed_money < money:
		var diff = money - displayed_money
		displayed_money += int(clamp(diff * 0.05, 1, 5))
	elif displayed_money > money:
		displayed_money -= 1
	moneycount.text = "$" + str(displayed_money)

	money_per_sec_label.text = "+ " + str(moneypersec) + " /sec"
	
	
	if money >= 50 and !bought1 :
		$CanvasLayer/BUY1/AnimationPlayer.play("fade")
	else :
		$CanvasLayer/BUY1/AnimationPlayer.stop()

	if money >= 150 and !bought2 :
		$CanvasLayer/BUY2/AnimationPlayer.play("fade")
	else:$CanvasLayer/BUY2/AnimationPlayer.stop()
	if money >= 400 and !bought3:
		$CanvasLayer/BUY3/AnimationPlayer.play("fade")
	else:
		$CanvasLayer/BUY3/AnimationPlayer.stop()

func pop_label():
	moneycount.scale = base_scale

	var tween := create_tween()
	tween.tween_property(moneycount, "scale", base_scale * 1.05, 0.12)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_OUT)

	tween.tween_property(moneycount, "scale", base_scale, 0.18)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_IN)
func _on_buttered_buns_pressed() -> void:

	if money >= 50:
		money -= 50
		moneyperclick += 1
		moneypersec += 1
		$"CanvasLayer/buttered buns/AnimationPlayer".play("pessed")
		$CanvasLayer/Done1/AnimationPlayer.play("DONE")
		$"CanvasLayer/buttered buns".mouse_filter = Control.MOUSE_FILTER_IGNORE


		bought1 = true


func _on_money_timer_timeout() -> void:
	money += moneypersec
	
