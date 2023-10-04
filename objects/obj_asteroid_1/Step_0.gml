
if(phy_speed_y < 4 ){
	
	phy_speed_y = phy_speed_y + phy_speed_y*acceleration
}

if (hp <= 0) {
	instance_destroy();
}

img_rand = random_range(1,4)


if phy_rotation >= 360 or phy_rotation <= -360{

	phy_rotation = 0;
	
	image_index = img_rand
}


		// Gravity pull reaction on black hole power-up


if phy_position_y >= 400 and instance_exists(obj_gravity_pull){
	phy_rotation = -point_direction(x,y,obj_gravity_pull.x,obj_gravity_pull.y)+90
	
	if x <= room_width/2
	{ 
		phy_speed_x += 1;
		phy_speed_y += 2
	}
	else
	{
		phy_speed_x -= 1
		phy_speed_y += 2
	}
	
	if y >= obj_gravity_pull.y+200{
		
		phy_speed_y -= 10
		
	}
}
