extends KinematicBody2D
var velocity=Vector2(0,0)
var SPEED=200
var last_velocity=Vector2(1,0)
onready var projectile=preload("res://Scenes/Projectile.tscn")
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("up"):
		velocity.y=-1
	elif Input.is_action_pressed("down"):
		velocity.y=1
	else:
		velocity.y=0
	if Input.is_action_pressed("left"):
		velocity.x=-1
	elif Input.is_action_pressed("right"):
		velocity.x=1
	else:
		velocity.x=0
	velocity=velocity.normalized()*SPEED
	var collision=move_and_collide(velocity*delta)
	if velocity!=Vector2(0,0):
		last_velocity=velocity
	
	if Input.is_action_just_pressed("shoot"):
		var p=projectile.instance()
		get_parent().add_child(p)
		p.start(global_position,last_velocity)
