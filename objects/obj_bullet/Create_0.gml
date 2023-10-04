/// @description Insert description here
// You can write your code in this editor
phy_bullet = true;
start_pos = phy_position_y
start_pos_x = phy_position_x
phy_fixed_rotation = true;

phy_speed_y = irandom_range(-1,-50);
phy_speed_x = 1;
x_mass_adj = 0;
y_mass_adj = 50;
physics_mass_properties(phy_mass,x_mass_adj,y_mass_adj, 0)
angle_supp = 360;




