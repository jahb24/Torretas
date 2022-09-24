extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal shoot

var target = null
var can_shoot = true

var Bullet = preload("res://Bullet.tscn")

func flash():
	$fires.show()
	yield(get_tree().create_timer(0.09), "timeout")
	$fires.hide()


func shoot():
	if can_shoot:
		emit_signal("shoot", $puntero.global_transform)
		emit_signal("shoot", $puntero2.global_transform)
		flash()
		can_shoot = false
		yield(get_tree().create_timer(0.15), "timeout")
		can_shoot = true
	var bullet = Bullet.instance()
	var bullet2 = Bullet.instance()
	bullet.position = $puntero.get("position")
	bullet.velocity = $puntero.get("position").y * bullet.speed
	#bullet.rotation = rotation_degrees
	add_child(bullet)
	
	bullet2.position = $puntero2.get("position")
	bullet2.velocity = $puntero2.get("position").y * bullet.speed
	#bullet2.rotation = rotation_degrees
	add_child(bullet2)
	
	bullet.sound()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var tecla
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		rotation += 0.2
	if Input.is_action_pressed("ui_left"):
		rotation -= 0.2
	if Input.is_action_pressed("ui_accept"):
		visible = 0
		shoot()
		visible = 1
#	pass
