extends Area2D

var valor = 10


func _on_body_entered(body):
	if (body is CharacterBody2D):
		body.feed(valor)
		queue_free()
