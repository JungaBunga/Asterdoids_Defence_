/// @description Insert description here
// You can write your code in this editor
var enemy_in_range = collision_rectangle(0,y,room_width,y-200, obj_asteroid_1,false,false);

closest_enemy = instance_nearest(x,y,obj_asteroid_1);

if (enemy_in_range){

closest_enemy.phy_speed_y = 0.5


}

if hp <= 0 {
	
	instance_destroy(self);
	
	
}