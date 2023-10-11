extends CharacterBody2D

signal createNewIndividuo
@onready var timer = $Timer


var SPEED = 100.0
var tempoParaMudarDeDirecao = 5.0
var curvaSuave = 1
var tamanho = 1

var energia = 50
var consumoDeEnergia = 1

var direction_atual = Vector2(0,0)
var direction_nova = Vector2(0,0)

var tick = 0
@onready var viewPort = Globais.viewport
@onready var energiaValorMitosi = Globais.energiaMitosis


func _ready():
	direction_nova = Vector2(randf_range(-1.0, 1.0),randf_range(-1.0, 1.0)).normalized()
	timer.wait_time = tempoParaMudarDeDirecao
	
	consumoDeEnergia *= consumoDeEnergia * tamanho * (SPEED/600)
	scale = Vector2(tamanho,tamanho)

func _physics_process(delta):
	outOfBounds()
	movement(delta) 
	larica(delta)
	isDead()
	mitosis()


func init(args):
	SPEED = args['speed']
	tempoParaMudarDeDirecao = args['tempoParaMudarDeDirecao'] / 5
	curvaSuave = args['curvaSuave']
	tamanho = args['tamanho']


func isDead():
	if (energia <= 0):
		queue_free()


func larica(delta):
	tick += delta
	if(tick >= 1):
		energia -= consumoDeEnergia
		tick = 0


func outOfBounds():
	var r = Globais.mapaRaio
	if(position.distance_to(Vector2.ZERO) > r):
		position = Vector2(r * (abs(position.x)/-position.x) ,r * (abs(position.y)/-position.y)).normalized()


func movement(delta):
	direction_atual = direction_atual.lerp(direction_nova,delta * curvaSuave).normalized()
	velocity = direction_atual * SPEED
	move_and_slide()


func _on_timer_timeout():
	randomize()
	direction_atual = direction_nova
	direction_nova = Vector2(randf_range(-1.0, 1.0),randf_range(-1.0, 1.0)).normalized()


func feed(valor):
	energia += valor


func mitosis():
	if(energia >= Globais.energiaMitosis):
		var speed = SPEED
		if(mutar()):
			speed = randi_range(Globais.speedMin,Globais.speedMax)
		
		var newTempoParaMudarDeDirecao = tempoParaMudarDeDirecao
		if(mutar()):
			newTempoParaMudarDeDirecao = randf_range(Globais.tempoParaMudarDeDirecaMin,Globais.tempoParaMudarDeDirecaMax)
		
		var newCurvaSuave = curvaSuave
		if(mutar()):
			newCurvaSuave = randf_range(Globais.curvaSuaveMin,Globais.curvaSuaveMax)
		
		var newTamanho = tamanho
		if(mutar()):
			newTamanho = randf_range(Globais.tamanhoMin,Globais.tamanhoMax)



		var argumentos = {
			'speed' : speed,
		 	'tempoParaMudarDeDirecao' : newTempoParaMudarDeDirecao,
		 	'curvaSuave' : newCurvaSuave,
			'tamanho' : newTamanho,
		}
		
		emit_signal("createNewIndividuo", position, argumentos)
		energia = 50


func mutar():
	randomize()
	var percent = randf()
	if (percent <= Globais.chanceDeMutacao/100):
		return true
	else:
		return false




















