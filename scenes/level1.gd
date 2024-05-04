extends Node2D

func _ready():
	$YTLiveChat.start_get_message_loop_by_file("ytconfig.json", "fqyDEdqXe3U")
