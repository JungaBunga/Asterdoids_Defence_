placement_id = id;
global.not_enought =""
alarm[3] = 60;

if x < 365 and x > 0{
	
	instance_destroy(obj_tower_choose_rocket)
	instance_destroy(obj_tower_choose_laser)
	//instance_create_layer(x+180,y-50,"towers",obj_tower_choose_rocket);
	//instance_create_layer(x+100,y-200,"towers",obj_tower_choose_laser);
	alarm[0] = 5;
	
}

if x > 365 and x < (room_width-180){
	
	instance_destroy(obj_tower_choose_rocket)
	instance_destroy(obj_tower_choose_laser)
	//instance_create_layer(x-100,y-170,"towers",obj_tower_choose_rocket);
	//instance_create_layer(x+100,y-170,"towers",obj_tower_choose_laser);
	alarm[1] = 5;
	
}

if x > (room_width-185) and x < room_width{
	instance_destroy(obj_tower_choose_rocket)
	instance_destroy(obj_tower_choose_laser)
	//instance_create_layer(x-200,y-200,"towers",obj_tower_choose_rocket);
	//instance_create_layer(x,y-170,"towers",obj_tower_choose_laser);
	alarm[2] = 5;
	
}