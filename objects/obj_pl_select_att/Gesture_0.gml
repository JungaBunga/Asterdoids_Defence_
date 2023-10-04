/// @description Insert description here
// You can write your code in t
if global.coins >= 20 {
	global.coins -= 20
instance_destroy(obj_plaform_selection);
instance_destroy(self);
instance_destroy(obj_pl_select_def);
instance_create_layer(540,room_height-panel_y_pos,"Instances", obj_platform_att);
/*instance_create_layer (room_width-180,room_height-panel_y_pos,"Instances",obj_platform_att);
instance_create_layer (room_width+180-room_width,room_height-panel_y_pos,"Instances",obj_platform_att);
instance_create_layer (room_width+540-room_width,room_height-panel_y_pos,"Instances",obj_platform_att);*/
panel_y_pos +=250
instance_create_layer(80,room_height-panel_y_pos,"lay_selections",obj_plaform_selection)
instance_create_layer(room_width-80,room_height-panel_y_pos,"lay_selections",obj_plaform_selection)
}
else {
	money_low = true;
}

