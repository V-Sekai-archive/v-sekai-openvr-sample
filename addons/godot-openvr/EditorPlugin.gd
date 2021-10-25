@tool
extends EditorPlugin

var export_plugin


func _enter_tree():
	export_plugin = preload("res://addons/godot-openvr/OpenVRExportPlugin.gd")

	if export_plugin:
		export_plugin = export_plugin.new()
		if export_plugin:			
			add_export_plugin(export_plugin)


func _exit_tree():
	if export_plugin:
		remove_export_plugin(export_plugin)
