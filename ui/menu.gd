extends Control

@onready var quantidadeComidinhasSlider = $MarginContainer/VBoxContainer/quantidadeComidinhas/HSlider
@onready var quantidadeComidinhasNumber = $MarginContainer/VBoxContainer/quantidadeComidinhas/SpinBox
@onready var timerComidinhasSlider = $MarginContainer/VBoxContainer/timerComidinhas/HSlider
@onready var timerComidinhasNumber = $MarginContainer/VBoxContainer/timerComidinhas/SpinBox
@onready var energiaMitosisSlider = $MarginContainer/VBoxContainer/energiaMitosis/HSlider
@onready var energiaMitosisNumber = $MarginContainer/VBoxContainer/energiaMitosis/SpinBox
@onready var chanceMutacaoSlider = $MarginContainer/VBoxContainer/chanceMutacao/HSlider
@onready var chanceMutacaoNumber = $MarginContainer/VBoxContainer/chanceMutacao/SpinBox
@onready var tickRateSlider = $MarginContainer/VBoxContainer/tickRate/HSlider
@onready var tickRateNumber = $MarginContainer/VBoxContainer/tickRate/SpinBox
@onready var mapaRaioSlider = $MarginContainer/VBoxContainer/tamanhoMapa/HSlider
@onready var mapaRaioNumber = $MarginContainer/VBoxContainer/tamanhoMapa/SpinBox



func _ready():
	quantidadeComidinhasSlider.value = Globais.quantidadeComidinhas
	quantidadeComidinhasNumber.value = Globais.quantidadeComidinhas
	timerComidinhasSlider.value = Globais.timerComidinhas
	timerComidinhasNumber.value = Globais.timerComidinhas
	energiaMitosisSlider.value = Globais.energiaMitosis
	energiaMitosisNumber.value = Globais.energiaMitosis
	chanceMutacaoSlider.value = Globais.chanceDeMutacao
	chanceMutacaoNumber.value = Globais.chanceDeMutacao
	tickRateSlider.value = Globais.tickRate
	tickRateNumber.value = Globais.tickRate
	mapaRaioSlider.value = Globais.mapaRaio
	mapaRaioNumber.value = Globais.mapaRaio



func onQuantidadeComidinhas(value):
	Globais.quantidadeComidinhas = value
	quantidadeComidinhasSlider.value = value
	quantidadeComidinhasNumber.value = value


func onTimerComidinhas(value):
	Globais.timerComidinhas = value
	timerComidinhasSlider.value = value
	timerComidinhasNumber.value = value


func onEnergiaMitosis(value):
	Globais.energiaMitosis = value
	energiaMitosisSlider.value = value
	energiaMitosisNumber.value = value


func onChanceMutacao(value):
	Globais.chanceDeMutacao = value
	chanceMutacaoSlider.value = value
	chanceMutacaoNumber.value = value

func onTickRate(value):
	Globais.tickRate = value
	tickRateSlider.value = value
	tickRateNumber.value = value


func onTamanhoMapa(value):
	Globais.mapaRaio = value
	mapaRaioSlider.value = value
	mapaRaioNumber.value = value

