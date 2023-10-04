/// @description Insert description here
// You can write your code in this editor
current_damping = phy_linear_damping;

if(current_damping == 0){
	phy_linear_damping = random_range(0.5,3);
}


		//change speed after collision based on velocity and speed

if(phy_speed_y > 10 ){
	phy_speed_y = phy_speed_y - phy_speed*(phy_linear_damping/10);
}
else{
	phy_speed_y = choose(3,4,5);
}