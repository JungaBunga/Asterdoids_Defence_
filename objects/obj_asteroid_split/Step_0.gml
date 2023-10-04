/// @description Insert description here
// You can write your code in this editor
if(phy_speed_y < 4 ){
	
	phy_speed_y = phy_speed_y + phy_speed_y*acceleration
}

if (hp <= 0) {
	instance_destroy();
	
	for (var i = 0; i < 3; i += 1){
	
	adjust += 70
	instance_create_layer(x+adjust,y+adjust,"Instances",obj_asteroid_small);
}
}
img_rand = random_range(1,4)