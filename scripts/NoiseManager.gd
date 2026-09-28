extends Node

# Shovqin tizimining eng sodda ko'rinishi (8.1-bo'lim): manba nuqtasi va
# radiusi bo'lgan hodisa; radius ichidagi dushmanlar tekshiradi.

func emit_noise(from_position: Vector2, radius: float) -> void:
	for enemy in get_tree().get_nodes_in_group("enemies"):
		if not enemy.has_method("hear_noise"):
			continue
		if enemy.global_position.distance_to(from_position) <= radius:
			enemy.hear_noise(from_position)
