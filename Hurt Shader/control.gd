extends Control

@onready var shader_material = $PlayerHurt.material
var tween

func _on_ouch_pressed():
	var new_intensity = shader_material.get_shader_parameter("intensity")
	new_intensity += 0.05
	new_intensity = clamp(new_intensity, 0.2,0.5)
	shader_material.set_shader_parameter("intensity",new_intensity)
	$PlayerHurt/Timer.start()
	if tween:
		tween.kill()

func _on_timer_timeout():
	tween = create_tween()
	tween.tween_property(shader_material,"shader_parameter/intensity",0.0,5.0)
	tween.play()
