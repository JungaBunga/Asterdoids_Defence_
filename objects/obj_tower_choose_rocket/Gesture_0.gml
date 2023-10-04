if global.coins < 40{
	global.not_enought = true
}


if x < 365 and x > 0 and global.coins >= 40{
	left_rocket = instance_create_layer(x-170,y+50,"towers",obj_tower_parent);
	global.coins -= 40;
	instance_destroy(placement_id);
	instance_destroy(self);
	
}

if x > 365 and x < (room_width-400)and global.coins >= 40{
	middle_rocket = instance_create_layer(x+100,y+170,"towers",obj_tower_parent);
	global.coins -= 40;
	instance_destroy(placement_id);
	instance_destroy(self);
	
	
}

if x > (room_width-390)and global.coins >= 40{

	right_rocket = instance_create_layer(x+100,y+200,"towers",obj_tower_parent);
	global.coins -= 40;
	instance_destroy(placement_id);
	instance_destroy(self);
}
