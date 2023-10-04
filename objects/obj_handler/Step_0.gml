		//Buttons control system

if global.pow_up_speed == true {
	type = spr_power_up_speed
}
if global.pow_up_slow == true {
	type = spr_power_up_slow
}
if global.pow_up_grav == true {
	type = spr_power_up_grav
}


if button_middle.check_pressed(){		//
show_debug_message("CENTRE_WORKS")
}



if global.pow_picked_up == true and left_loaded == false{  // LEFT BUTTON POWER_UP PICK-UP CHANGES BUTTON

	gui_delete(button_left)
	button_left = gui_create_button(sprite_relative_pos_left,global.ideal_height*0.875,global.ideal_width/10,global.ideal_height/10,"",,,,0,,,0,type);
	global.pow_picked_up = false;
	left_loaded = true;

		if type = spr_power_up_slow{
			left_button_slow = true
		}
		if type = spr_power_up_speed{
			left_button_speed = true
		}
		if type = spr_power_up_grav{
			left_button_grav = true
		}



}


if global.pow_picked_up == true and left_loaded == true{ // RIGHT BUTTON POWER_UP PICK-UP CHANGES BUTTON

	gui_delete(button_right)
	button_right = gui_create_button(sprite_relative_pos_right,global.ideal_height*0.875,global.ideal_width/10,global.ideal_height/10,"",,,,0,,,0,type)
	global.pow_picked_up = false;
	right_loaded = true;


		if type = spr_power_up_slow{
			right_button_slow = true
		}
		if type = spr_power_up_speed{
			right_button_speed = true
		}
		if type = spr_power_up_grav{
			right_button_grav = true
		}

}



if button_left.check_pressed() and left_loaded == true{
	show_debug_message("LEFT_WORKS")
	gui_delete(button_left)
	button_left = gui_create_button(sprite_relative_pos_left,global.ideal_height*0.875,global.ideal_width/10,global.ideal_height/10,"",,,,0,,,0,s_tile_ui);


			// POWER-UP SPEED FOR LEFT BUTTON 
	
	if left_button_speed == true 
	{
		if instance_exists(obj_tower_parent){
			global.reload_time = room_speed/2;
		}
		if instance_exists(obj_tower_laser){
			global.reload_time_l = room_speed;
		}
		
		alarm[2] = room_speed*10
		left_button_speed = false
	}
	
			// MEGASLOW FOR ASTEROIDS
	if left_button_slow == true 
	{
		mass_slow = true;
		alarm[3] = room_speed*10
		left_button_slow = false
	}
	
	
			// BLACK HOLE mechanics, creates a gravity pull towards center of the map
	if left_button_grav == true 
	{
		g_pull = instance_create_layer(room_width/2,room_height/4,"Instances",obj_gravity_pull);
		alarm[4] = room_speed*10
		left_button_grav = false
	}
	
	left_loaded = false

}
if button_right.check_pressed() and right_loaded == true{
	show_debug_message("LEFT_WORKS")
	gui_delete(button_right)
	button_right = gui_create_button(sprite_relative_pos_right,global.ideal_height*0.875,global.ideal_width/10,global.ideal_height/10,"",,,,0,,,0,s_tile_ui);
	
	// POWER-UP SPEED FOR RIGHT BUTTON 
	
	if right_button_speed == true 
	{
		if instance_exists(obj_tower_parent){
			global.reload_time = room_speed/2;
		}
		if instance_exists(obj_tower_laser){
			global.reload_time_l = room_speed;
		}
		
		alarm[2] = room_speed*10
		right_button_speed = false
	}
	
			// MEGASLOW FOR ASTEROIDS
	if right_button_slow == true 
	{
		mass_slow = true;
		alarm[3] = room_speed*10
		right_button_slow = false
	}
	
	
			// BLACK HOLE mechanics, creates a gravity pull towards center of the map
	if right_button_grav == true 
	{
		g_pull = instance_create_layer(room_width/2,room_height/4,"Instances",obj_gravity_pull);
		alarm[4] = room_speed*10
		right_button_grav = false
	}
	
	right_loaded = false
	
	
}

if mouse_check_button_pressed(mb_left) 
and instance_exists(obj_tower_choose_laser)
{
	alarm[1] = 10;
}

if mouse_check_button_pressed(mb_left) 
and instance_exists(obj_tower_choose_rocket)
{
	alarm[1] = 10;
}

if mouse_check_button_pressed(mb_left) 
and instance_exists(obj_pl_select_att)
{
	alarm[1] = 10;
}

if mouse_check_button_pressed(mb_left) 
and instance_exists(obj_pl_select_def)
{
	alarm[1] = 10;
}

if mass_slow == true{
	obj_asteroid_1.phy_speed_y = 0.1
}
