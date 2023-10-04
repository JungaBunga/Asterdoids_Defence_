/// @description Insert description here
// You can write your code in this editor
	instance_destroy(obj_plaform_selection);
	panel_y_pos -= 250
	instance_create_layer(80,room_height-panel_y_pos,"Instances",obj_plaform_selection)
	instance_create_layer(room_width-80,room_height-panel_y_pos,"Instances",obj_plaform_selection)