extends Node

@onready var viewport = get_parent().get_viewport().size / 0.3 / 2


var mapaRaio = 1000

var quantidadeComidinhas = 100
var timerComidinhas = 10
var energiaMitosis = 100
var tickRate = 1

var speedMin = 100
var speedMax = 1200
var tempoParaMudarDeDirecaMin = 0.5
var tempoParaMudarDeDirecaMax = 10.0
var curvaSuaveMin = 0.1
var curvaSuaveMax = 2.0
var tamanhoMin = 0.4
var tamanhoMax = 3
var chanceDeMutacao = 10
