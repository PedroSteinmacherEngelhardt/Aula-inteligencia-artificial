extends Node2D

var comidinha = preload("res://props/comidinha.tscn")
var individuo = preload("res://individuo/individuo.tscn")

var tick = 0
var zoomSpeed = 0.9
var zoomLevel


func _input(event):
	if event.is_action_pressed('zoom_in'):
		$Camera2D.zoom /= Vector2(zoomSpeed,zoomSpeed)
	if event.is_action_pressed('zoom_out'):
		$Camera2D.zoom *= Vector2(zoomSpeed,zoomSpeed)



func _ready():
	var emitter = get_node("Individuo")
	emitter.createNewIndividuo.connect(createNewIndividuo)
	
	generateComidinhas()
	


func _process(delta):
	Engine.time_scale = Globais.tickRate
	
	tick += delta
	if (tick >= Globais.timerComidinhas):
		generateComidinhas()
		tick = 0
	


func generateComidinhas():
	var raio = Globais.mapaRaio
	for i in Globais.quantidadeComidinhas:
		randomize();
		var newComidinha = comidinha.instantiate() as Area2D
		var r = randf()
		var direction = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
		direction *= raio * sqrt(r)
		
		#var positionX = randf_range(-Globais.tamanhoMapa.x, Globais.tamanhoMapa.x)
		#var positionY = randf_range(-Globais.tamanhoMapa.y, Globais.tamanhoMapa.y)
		
		newComidinha.position = direction#Vector2(positionX,positionY)
		add_child(newComidinha)


func createNewIndividuo(newPosition, args):
	var newIndividuo = individuo.instantiate()
	newIndividuo.position = newPosition
	newIndividuo.init(args)
	add_child(newIndividuo)
	

