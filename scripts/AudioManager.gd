extends Node

# Tiny procedural sound effects (sine-wave tones) so the project needs no
# external audio assets. Autoloaded as a singleton.

const MIX_RATE := 22050

var _player: AudioStreamPlayer
var _ding_stream: AudioStreamSample
var _warn_stream: AudioStreamSample

func _ready() -> void:
	_player = AudioStreamPlayer.new()
	add_child(_player)
	_ding_stream = _make_tone(880.0, 0.12, 0.5, true)
	_warn_stream = _make_tone(220.0, 0.22, 0.6, false)

func _make_tone(freq: float, duration: float, volume: float, rising: bool) -> AudioStreamSample:
	var sample_count := int(MIX_RATE * duration)
	var data := PoolByteArray()
	data.resize(sample_count * 2)
	for i in range(sample_count):
		var t := float(i) / MIX_RATE
		var f := freq * (1.6 if (rising and t > duration * 0.5) else 1.0)
		var envelope := 1.0 - float(i) / sample_count
		var sample_val := sin(2.0 * PI * f * t) * volume * envelope
		var s16 := int(clamp(sample_val, -1.0, 1.0) * 32767.0)
		data[i * 2] = s16 & 0xFF
		data[i * 2 + 1] = (s16 >> 8) & 0xFF
	var stream := AudioStreamSample.new()
	stream.format = AudioStreamSample.FORMAT_16_BITS
	stream.mix_rate = MIX_RATE
	stream.stereo = false
	stream.data = data
	return stream

func play_ding() -> void:
	_player.stream = _ding_stream
	_player.play()

func play_warning() -> void:
	_player.stream = _warn_stream
	_player.play()
