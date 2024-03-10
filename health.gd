extends Node2D

@export var regen_rate = 1
@export var dodge_chance = 0.0

@export var free_on_death=true

@export var shield=0

signal hit(damage)
signal shield_break(damage)
signal die()

func hurt(damage):
	hit.emit(damage)
	if(shield>0):
		shield-=1
		if(shield<=0):
			shield_break.emit(damage)
		return
	if(randf()<dodge_chance):
		#dodge_sfx.play()
		return

	#spawn damge numbers
#	var instance = dmgn.instantiate()
#	instance.text=str(damage)
#	get_tree().get_root().get_node("main").add_child(instance)
#	instance.global_position=global_position

	$bar.value-=damage

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if($bar.value <=0):
		die.emit()
		if(free_on_death):
			get_parent().queue_free()
	$bar.value+=delta*regen_rate
	$follow_bar.max_value=$bar.max_value
	if($follow_bar.value > $bar.value):
		$follow_bar.value-=delta*$bar.max_value
	else:
		$follow_bar.value=$bar.value

