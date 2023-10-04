near = instance_nearest(x,y,obj_asteroid_1);
//side_acceleration = 1
gravity_direction = point_direction(x,y,near.x,near.y)







if instance_exists(obj_asteroid_1){


if near.x <= x and near.y > start_pos_y-500{
	phy_speed_y += -2;
	phy_speed_x += -10
	
}
if near.x > x and near.y > start_pos_y-500{
	phy_speed_y += -2;
	phy_speed_x += 10
	
}



}

	








/*if near.x <= x{
physics_apply_force(x,y, -near.x*side_acceleration, -1000)
physics_apply_local_impulse(x,y-50, -30,-5)
}
else{
physics_apply_force(x,y, near.x*side_acceleration, -1000)
physics_apply_local_impulse(x,y-50, 30,-5)


}

if phy_position_y < start_pos-800{
	instance_destroy(self)
}

*/