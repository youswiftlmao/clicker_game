extends Node2D

var money: int = 0
var moneyperclick: int = 1
var moneypersec: int = 0
var displayed_money: int = 0
var animation_speed := 10.0  

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
	


func _process(delta: float) -> void:
	displayed_money = lerp(displayed_money, money, delta * animation_speed)

	# Snap when close enough
	if abs(displayed_money - money) < 1:
		displayed_money = money

	moneycount.text = "$" + str(int(displayed_money))
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
	if money >= 900 and !bought4:
		$CanvasLayer/BUY4/AnimationPlayer.play("fade")
	else:
		$CanvasLayer/BUY4/AnimationPlayer.stop()
	if money >= 2000 and !bought5:
		$CanvasLayer/BUY5/AnimationPlayer.play("fade")
	else:
		$CanvasLayer/BUY5/AnimationPlayer.stop()
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
	MPSUPD()


func _on_mystermy_meat_pressed() -> void:
	if money >= 150:
		money -= 150
		moneyperclick += 2
		moneypersec += 1
		$"CanvasLayer/mystermy meat/AnimationPlayer".play("pressed")
		$CanvasLayer/Done2/AnimationPlayer.play("DONE")
		$"CanvasLayer/mystermy meat".mouse_filter = Control.MOUSE_FILTER_IGNORE
		bought2 = true

func _on_cooking_meat_pressed() -> void:
	if money >= 400:
		money -= 400
		moneyperclick += 4
		moneypersec += 1
		$"CanvasLayer/cooking meat/AnimationPlayer".play("pressed")
		$CanvasLayer/Done3/AnimationPlayer.play("DONE")
		$"CanvasLayer/cooking meat".mouse_filter = Control.MOUSE_FILTER_IGNORE
		bought3 = true


func _on_use_real_meat_pressed() -> void:
	if money >= 900:
		money -= 900
		moneyperclick += 2
		moneypersec += 2
		$"CanvasLayer/use real meat/AnimationPlayer".play("presed")
		$CanvasLayer/Done4/AnimationPlayer.play("DONE")
		$"CanvasLayer/use real meat".mouse_filter = Control.MOUSE_FILTER_IGNORE
		bought4 = true


func _on_serv_w__fried_pressed() -> void:
		if money >= 2000:
			money -= 2000
			moneyperclick += 10
			
			moneypersec += 10
			$"CanvasLayer/serv w_ fried/AnimationPlayer".play("pesed")
			$CanvasLayer/Done5/AnimationPlayer.play("DONE")
			$"CanvasLayer/serv w_ fried".mouse_filter = Control.MOUSE_FILTER_IGNORE
			bought5 = true
			
func MPSUPD():
	money += moneypersec
	if moneypersec > 0:
		pop_label()
