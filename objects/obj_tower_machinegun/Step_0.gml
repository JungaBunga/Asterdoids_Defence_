/// @description Insert description here
// You can write your code in this editor
var enemy_in_range = collision_circle(x,y, tower_range, obj_asteroid_1,false,false);
closest_enemy = instance_nearest(x,y,obj_asteroid_1);


if instance_exists(obj_asteroid_1){
if (enemy_in_range) and (ready_to_fire) {
		//shoot nearest
		
	ready_to_fire = false;
	alarm[0] = global.reload_time;
	
	with (instance_create_layer(x,y-100,"Instances",obj_mgun_bullet))
	{
			
		gravity_direction = point_direction(x,y,other.closest_enemy.x,other.closest_enemy.y)
		
	
	}
	

}



if closest_enemy.x <= x{

	phy_rotation += -0.1

	
}
else{
	phy_rotation += 0.1

	}
	
if phy_rotation < -25{
		
		phy_rotation += 1;}

if phy_rotation >25{
		
		phy_rotation += -1;}

}
if tower_hp <= 0{
	instance_destroy();
}
