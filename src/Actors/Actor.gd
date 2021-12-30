extends KinematicBody2D
class_name Actor

export var speed = Vector2(300.0, 1000.0)
export var gravity = 3000.0
var velocity = Vector2.ZERO

func map(value, istart, istop, ostart, ostop):
	return ostart + (ostop - ostart) * ((value - istart) / (istop - istart));
