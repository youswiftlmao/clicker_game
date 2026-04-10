extends TextureButton




func _on_pressed() -> void:
	$AnimationPlayer.stop()
	$AnimationPlayer.play("PRESSED")
	$"../clciksfx".play()


func _on_mouse_entered() -> void:
	$AnimationPlayer.stop()
	$"../hover".play()
	$AnimationPlayer.play("hover")


func _on_mouse_exited() -> void:
	$AnimationPlayer.stop()
	$AnimationPlayer.play("unhover")
	$"../unhover".play()
