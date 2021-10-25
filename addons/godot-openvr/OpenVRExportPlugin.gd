@tool
extends EditorExportPlugin

func _export_begin(features: PackedStringArray, is_debug: bool, path: String, flags: int ):
	var dir = Directory.new()
	
	var export_to = path.get_base_dir() + "/actions/"
	
	# now determine which action files to export
	var export_from = ""
	if dir.file_exists("res://actions/actions.json"):
		export_from = "res://actions/"
	elif dir.file_exists("res://addons/godot-openvr/actions/actions.json"):
		export_from = "res://addons/godot-openvr/actions/"
	else:
		print("WARNING: Couldn't locate actions files to export")
		return

	if !dir.dir_exists(export_to):
		dir.make_dir(export_to)
	
	if dir.open(export_from) == OK:
		dir.list_dir_begin(true, true)
		
		var filename = dir.get_next()
		while filename != "":
			# print("Copy " + filename)
			dir.copy(export_from + filename, export_to + filename)
			
			filename = dir.get_next()
		
		dir.list_dir_end()
