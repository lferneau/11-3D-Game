extends CSGCylinder

var max_size = 3
var min_size = 0.1
var change_size = 0.02
var movement = 0.02

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("increase_size"):
		increase_size(change_size)
	if Input.is_action_pressed("decrease_size"):
		decrease_size(change_size)
	if Input.is_action_pressed("move_back"):
		translation += Vector3(0,0,-movement)
	if Input.is_action_pressed("move_forward"):
		translation += Vector3(0,0,movement)
	if Input.is_action_pressed("move_left"):
		translation += Vector3(-movement,0,0)
	if Input.is_action_pressed("move_right"):
		translation += Vector3(movement,0,0)
		
func increase_size(size):
	var target = radius + size
	target = min(target, max_size)
	if target != radius:
		$Tween.interpolate_property(self,"radius", radius, target,0.4,Tween.TRANS_BOUNCE,Tween.EASE_OUT)
		$Tween.start()
	
func decrease_size(size):
	var target = radius - size
	target = max(target, min_size)
	if target != radius:
		$Tween.interpolate_property(self,"radius", radius, target,0.4,Tween.TRANS_BOUNCE,Tween.EASE_OUT)
		$Tween.start()