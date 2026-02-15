extends TextureButton





func _on_pressed() -> void:
	$AnimationPlayer.stop()
	$AnimationPlayer.play("PRESSED")


func _on_mouse_entered() -> void:
	$AnimationPlayer.stop()
	$AnimationPlayer.play("hover")


func _on_mouse_exited() -> void:
	$AnimationPlayer.stop()
	$AnimationPlayer.play("unhover")
func _physics_process(delta: float) -> void:
	print(scale)
