extends Area2D

export var move_forward = true
export var diff_move_vector = Vector2.ZERO
export var move_speed = 1.5
var start_position

func _ready():
	start_position = Vector2(position.x, position.y)
	pass

func _process(delta):
	if move_forward:
		position = position + diff_move_vector* move_speed * delta
	else:
		position = position - diff_move_vector* move_speed * delta
		
	if diff_move_vector > Vector2.ZERO:
		if position >= start_position + diff_move_vector:
			move_forward = false
		elif position <= start_position:
			move_forward = true
	else:
		if position <= start_position + diff_move_vector:
			move_forward = false
		elif position >= start_position:
			move_forward = true
		
	self.rotate(30 * delta)
	


func _on_DeathCube_body_entered(body):
	if body.has_method('get_hit'):
		body.call('get_hit', self)
