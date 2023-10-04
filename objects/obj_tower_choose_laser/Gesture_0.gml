
//instance_create_layer(x+200,y+200,"towers",obj_tower_laser);

if global.coins < 30{
	global.not_enought = true;
}

if x < 365 and x > 0 and global.coins >= 30{
	left_tow = instance_create_layer(x-100,y+150,"towers",obj_tower_laser);
	instance_destroy(placement_id);
	instance_destroy(self);
	global.coins -= 30;
	
}

if x > 365 and x < (room_width-400) and global.coins >= 30{
	middle_tow = instance_create_layer(x-100,y+130,"towers",obj_tower_laser);
	instance_destroy(placement_id);
	instance_destroy(self);
	global.coins -= 30;
	
}

if x > (room_width-390) and global.coins >= 30{
	right_tow = instance_create_layer(x+180,y,"towers",obj_tower_laser);
	instance_destroy(placement_id);
	instance_destroy(self);
	global.coins -= 30;
}

