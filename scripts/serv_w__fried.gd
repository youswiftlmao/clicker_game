extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var t = $FontArea5.global_transform
	$FontArea5.set_as_top_level(true)
	$FontArea5.global_transform = t







func _on_mouse_entered() -> void:
	$AnimationPlayer.stop()
	$AnimationPlayer.play("hober")


func _on_mouse_exited() -> void:
	$AnimationPlayer.stop()
	$AnimationPlayer.play("unhover")
