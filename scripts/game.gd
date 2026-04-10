extends Node2D

var money: int = 0
var moneyperclick: int = 1
var moneypersec: int = 0
var displayed_money: int = 0
var ham = false
var chez = false
var bigmac = false
var whopper = false

var bought1 = false
var bought2 = false
var bought3 = false
var bought4 = false
var bought5 = false
@onready var moneycount: RichTextLabel = $MONEYCOUNT
@onready var button := $MAINCLICKER
@onready var money_per_sec_label: RichTextLabel = $MONEY_PER_SEC

var base_scale: Vector2
var base_position: Vector2

func _ready():
	ham = true
	
	base_position = moneycount.position
	base_scale = moneycount.scale

func _on_texture_button_pressed() -> void:
	money += moneyperclick
	pop_label()

	


func _process(delta: float) -> void:
	$perclic.text = " Money per click: " + str(moneyperclick)
	var speed := 2000  # how fast the number catches up per second

	if displayed_money < money:
		displayed_money += speed * delta
		displayed_money = min(displayed_money, money)
	elif displayed_money > money:
		displayed_money -= speed * delta
		displayed_money = max(displayed_money, money)

	# Snap when close enough
	if abs(displayed_money - money) < 1:
		displayed_money = money

	moneycount.text = "$" + str(int(displayed_money))
	moneycount.text = "$" + str(displayed_money)

	money_per_sec_label.text = "+ " + str(moneypersec) + " /sec"
	
	#this is the area where upgrade antexture ids are updated

	if chez:
		$"CanvasLayer/buttered buns".texture_normal = load("res://assets/ketchup.png")
		$"CanvasLayer/buttered buns/FontArea/RichTextLabel".text = " ketchup for flavourr 
(+5)"
		$"CanvasLayer/buttered buns/FontArea/50".text = " $500 "
		$"CanvasLayer/mystermy meat".texture_normal = load("res://assets/PROPA CHEESE.png")
		$"CanvasLayer/mystermy meat/FontArea2/RichTextLabel".text = " Imported french cheese 
 (+15/s)"
		$"CanvasLayer/mystermy meat/FontArea2/150".text = " $1.25k"
		$"CanvasLayer/cooking meat".texture_normal = load("res://assets/soda.png")
		
		$"CanvasLayer/cooking meat/FontArea3/RichTextLabel2".text = " Pespi or coco cola ?
 hmmm..(+60$ revenue) "
		$"CanvasLayer/cooking meat/FontArea3/400".text = "$2.50k"
		$"CanvasLayer/use real meat".texture_normal = load("res://assets/shipblocked.png")

		$"CanvasLayer/use real meat/FontArea4/RichTextLabel3".text = " Imported ingredients 
 (+100$ revenue) "
		$"CanvasLayer/use real meat/FontArea4/900".text = "$7.00k"
		$"CanvasLayer/serv w_ fried".texture_normal = load("res://assets/locLLysourcedmeatsmh.png")
		$"CanvasLayer/serv w_ fried/FontArea5/RichTextLabel4".text = " Freshest of meats for 
 youu (+200$ revenue)"
		$"CanvasLayer/serv w_ fried/FontArea5/2000".text = "$20,000"
		$CanvasLayer/UPGRDCHEZ.texture_normal = load("res://assets/bigmacc.png")
		$CanvasLayer/UPGRDCHEZ/RichTextLabel.text = "$60,000"
		if money >= 500  and !bought1:
			$CanvasLayer/BUY1/AnimationPlayer.play("fade")
		else :
			$CanvasLayer/BUY1/AnimationPlayer.stop()
			
		if money >= 1250 and !bought2:
			$CanvasLayer/BUY2/AnimationPlayer.play("fade")
		else:
			$CanvasLayer/BUY2/AnimationPlayer.stop()
		if money >= 2500 and !bought3:
			$CanvasLayer/BUY3/AnimationPlayer.play("fade")
		else:
			$CanvasLayer/BUY3/AnimationPlayer.stop()
		if money >= 7000 and !bought4:
			$CanvasLayer/BUY4/AnimationPlayer.play("fade")
		else:
			$CanvasLayer/BUY4/AnimationPlayer.stop()
		if money >= 20000 and !bought5:
			$CanvasLayer/BUY5/AnimationPlayer.play("fade")
		else:
			$CanvasLayer/BUY5/AnimationPlayer.stop()
			
	if ham:
		if money >= 50  and !bought1 :
			$CanvasLayer/BUY1/AnimationPlayer.play("fade")
		else :
			$CanvasLayer/BUY1/AnimationPlayer.stop()

		if money >= 150 and  !bought2 :
			$CanvasLayer/BUY2/AnimationPlayer.play("fade")
		else:
			$CanvasLayer/BUY2/AnimationPlayer.stop()
		if money >= 400 and !bought3 and ham:
			$CanvasLayer/BUY3/AnimationPlayer.play("fade")
		else:
			$CanvasLayer/BUY3/AnimationPlayer.stop()
		if money >= 900 and !bought4 and ham:
			$CanvasLayer/BUY4/AnimationPlayer.play("fade")
		else:
			$CanvasLayer/BUY4/AnimationPlayer.stop()
		if money >= 2000 and !bought5 and ham:
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

	if money >= 50 and ham:
		money -= 50
		moneyperclick += 1
		moneypersec += 1
		$"money sound".play()
		$"CanvasLayer/buttered buns/AnimationPlayer".play("pessed")
		$CanvasLayer/Done1/AnimationPlayer.play("DONE")
		$"CanvasLayer/buttered buns".mouse_filter = Control.MOUSE_FILTER_IGNORE


		bought1 = true
	if money >= 500 and chez:
		money -= 500
		moneyperclick += 5
		moneypersec += 5
		$"money sound".play()
		$"CanvasLayer/buttered buns/AnimationPlayer".play("pessed")
		$CanvasLayer/Done1/AnimationPlayer.play("DONE")
		$"CanvasLayer/buttered buns".mouse_filter = Control.MOUSE_FILTER_IGNORE
		bought1 = true


func _on_money_timer_timeout() -> void:
	MPSUPD()


func _on_mystermy_meat_pressed() -> void:
	if money >= 150 and ham:
		money -= 150
		moneyperclick += 4
		moneypersec += 2
		$"money sound".play()
		$"CanvasLayer/mystermy meat/AnimationPlayer".play("pressed")
		$CanvasLayer/Done2/AnimationPlayer.play("DONE")
		$"CanvasLayer/mystermy meat".mouse_filter = Control.MOUSE_FILTER_IGNORE
		bought2 = true
		
	if money >= 1250 and chez:
		money -= 1250
		moneyperclick += 5
		moneypersec += 15
		$"money sound".play()
		$"CanvasLayer/mystermy meat/AnimationPlayer".play("pressed")
		$CanvasLayer/Done2/AnimationPlayer.play("DONE")
		$"CanvasLayer/mystermy meat".mouse_filter = Control.MOUSE_FILTER_IGNORE
		bought2 = true

func _on_cooking_meat_pressed() -> void:
	if money >= 400 and ham:
		money -= 400
		moneyperclick += 5
		moneypersec += 3
		$"money sound".play()
		$"CanvasLayer/cooking meat/AnimationPlayer".play("pressed")
		$CanvasLayer/Done3/AnimationPlayer.play("DONE")
		$"CanvasLayer/cooking meat".mouse_filter = Control.MOUSE_FILTER_IGNORE
		bought3 = true
		
	if money >= 2500 and chez:
		money -= 2500
		moneyperclick += 10
		moneypersec += 50
		$"money sound".play()
		$"CanvasLayer/cooking meat/AnimationPlayer".play("pressed")
		$CanvasLayer/Done3/AnimationPlayer.play("DONE")
		$"CanvasLayer/cooking meat".mouse_filter = Control.MOUSE_FILTER_IGNORE
		bought3 = true

func _on_use_real_meat_pressed() -> void:
	if money >= 900 and ham:
		money -= 900
		moneyperclick += 5
		moneypersec += 7
		$"money sound".play()
		$"CanvasLayer/use real meat/AnimationPlayer".play("presed")
		$CanvasLayer/Done4/AnimationPlayer.play("DONE")
		$"CanvasLayer/use real meat".mouse_filter = Control.MOUSE_FILTER_IGNORE
		bought4 = true
	if money >= 7000 and chez:
		money -= 7000
		moneyperclick += 50
		moneypersec += 50
		$"money sound".play()
		$"CanvasLayer/use real meat/AnimationPlayer".play("presed")
		$CanvasLayer/Done4/AnimationPlayer.play("DONE")
		$"CanvasLayer/use real meat".mouse_filter = Control.MOUSE_FILTER_IGNORE
		bought4 = true

func _on_serv_w__fried_pressed() -> void:
		if money >= 2000 and ham:
			money -= 2000
			moneyperclick += 15
			
			moneypersec += 10
			$"money sound".play()
			$"CanvasLayer/serv w_ fried/AnimationPlayer".play("pesed")
			$CanvasLayer/Done5/AnimationPlayer.play("DONE")
			$"CanvasLayer/serv w_ fried".mouse_filter = Control.MOUSE_FILTER_IGNORE
			bought5 = true
			
		if money >= 20000 and chez:
			money -= 20000
			moneyperclick += 100
			moneypersec += 100
			$"money sound".play()
			$"CanvasLayer/serv w_ fried/AnimationPlayer".play("pesed")
			$CanvasLayer/Done5/AnimationPlayer.play("DONE")
			$"CanvasLayer/serv w_ fried".mouse_filter = Control.MOUSE_FILTER_IGNORE
			bought5 = true
			
func MPSUPD():
	money += moneypersec
	if moneypersec > 0:
		pop_label()


func _on_upgrdchez_pressed() -> void:
	if money >= 5000 and ham:
		money -= 5000
		$loadingscreen/AnimationPlayer.play("renovation")
		$loadingscreen/LOADING/LOADER.play("LOADER")
		$CanvasLayer/HAMGON.play("fadeout")
		await $CanvasLayer/HAMGON.animation_finished
		$CanvasLayer.visible = false
		$MAINCLICKER.texture_normal = preload("res://assets/chez.png")
		$MAINCLICKER.custom_minimum_size = Vector2(30.1, 23.0)
		await $loadingscreen/AnimationPlayer.animation_finished
		$CanvasLayer/HAMGON.play("fadin")
		$"money sound".play()
		money = 0 
		moneypersec = 20
		moneyperclick = 10
		ham = false
		chez = true
		bought1 = false
		bought2 = false
		bought3 = false
		bought4 = false
		bought5 = false
		$"CanvasLayer/mystermy meat/FontArea2/RichTextLabel".position.x -= 4
		$"CanvasLayer/buttered buns/FontArea/RichTextLabel".position.y  -= 8
		$"CanvasLayer/serv w_ fried/FontArea5/RichTextLabel4".position.y -= 8
		
		
		# ^ fixes layout issue
		#fixing the issue where done icon appears b4 buying in chez stage
		$CanvasLayer/Done1/AnimationPlayer.play("RESET")
		$CanvasLayer/Done2/AnimationPlayer.play("RESET")
		$CanvasLayer/Done3/AnimationPlayer.play("RESET")
		$CanvasLayer/Done4/AnimationPlayer.play("RESET")
		$CanvasLayer/Done5/AnimationPlayer.play("RESET")
		#and fixing issue where mouse filter still ignores after rennovation to chez twt..
		$"CanvasLayer/serv w_ fried".mouse_filter = Control.MOUSE_FILTER_STOP
		$"CanvasLayer/use real meat".mouse_filter = Control.MOUSE_FILTER_STOP
		$"CanvasLayer/cooking meat".mouse_filter = Control.MOUSE_FILTER_STOP
		$"CanvasLayer/mystermy meat".mouse_filter = Control.MOUSE_FILTER_STOP
		$"CanvasLayer/buttered buns".mouse_filter = Control.MOUSE_FILTER_STOP
	if money >= 60000 and chez:
		get_tree().change_scene_to_file("res://wip.tscn")
#upd nvm will add it whithing here only
