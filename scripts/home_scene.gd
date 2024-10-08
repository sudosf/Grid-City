extends VBoxContainer

@onready var play_button: TextureButton = $Top/CenterContainer/PlayButton
@onready var level_selector_button: TextureButton = $Bottom/LevelSelectorButton
@onready var volume_button: TextureButton = $Bottom/VolumeButton
@onready var homeSound: AudioStreamPlayer2D = $HomeSound

const SOUND_ON = 'res://assets/gui/Button/Icon/SoundOn.png'
const SOUND_OFF = 'res://assets/gui/Button/Icon/SoundOff.png'
const GAME_SCENE = 'res://scenes/game_scene.tscn'

var LOADING_SCENE = "res://scenes/loading.tscn"
var LEVEL_SELECTOR_SCENE = "res://scenes/LevelMenu/levelSelector.tscn"

func _ready():
	homeSound.play()
	play_button.clicked.connect(load_main_scene)
	volume_button.clicked.connect(toggle_volume)
	level_selector_button.pressed.connect(load_level_selector_scene)

	volume_button.texture_file = SOUND_ON

func load_level_selector_scene():
	SceneLoader.load_scene(LEVEL_SELECTOR_SCENE, false)
	
func load_main_scene():
	SceneLoader.load_scene(GAME_SCENE)

func toggle_volume():
	if (volume_button.texture_file == SOUND_ON):
		homeSound.stop()
		volume_button.texture_file = SOUND_OFF
	else:
		homeSound.play()
		volume_button.texture_file = SOUND_ON

func _on_exit_clicked():
	get_tree().quit()
