if tower_hp <= 0{
	instance_destroy();
	instance_destroy(laser);
}
var enemy_in_range = collision_circle(x,y, tower_range, obj_asteroid_1,false,false);

closest_enemy = instance_nearest(x,y,obj_asteroid_1);


if instance_exists(obj_asteroid_1){
gravity_direction = point_direction(x,y,closest_enemy.x,closest_enemy.y)

if closest_enemy.x <= x and ready_to_fire = true{

	phy_rotation += -1	
}
else if closest_enemy.x >= x and ready_to_fire = true{
	phy_rotation += 1

	}
	
if phy_rotation < -25{
		
		phy_rotation += 1;}

if phy_rotation >25{
		
		phy_rotation += -1;}




if (enemy_in_range) and (ready_to_fire){
		//shoot nearest

	phy_rotation = -point_direction(x,y,closest_enemy.x,closest_enemy.y)+90
	
	//image_angle = point_direction(x,y,closest_enemy.x,closest_enemy.y)-90
		
	ready_to_fire = false;
	alarm[0] = global.reload_time_l;
	//alarm[2] = linger;
	
	laser = instance_create_layer(x,y-50,"Instances",obj_laser)
	//laser.image_angle = point_direction(x,y,closest_enemy.x,closest_enemy.y)-90;
	laser.phy_rotation = -point_direction(x,y,closest_enemy.x,closest_enemy.y)+90;
}
	
	
	
	//laser = collision_rectangle(id.x,id.y-3000,id.x+300,id.y,obj_asteroid_1,false,true)
	alarm[1] = 60
	//alarm[3] = 60
}


		
