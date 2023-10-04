near = instance_nearest(x,y,obj_asteroid_1);
//side_acceleration = 1

if near.x <= x{
	phy_speed_y += -3;
	phy_speed_x += -2.5
	angle_supp += -1
	//phy_rotation = angle_supp
	
}
else{
	phy_speed_y += -3;
	phy_speed_x += 2.5
	//phy_rotation += 1
	
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