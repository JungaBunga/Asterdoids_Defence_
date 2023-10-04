/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_circle(x,y, 500, true)
//enemy_in_range = collision_circle(x,y, 500, all,false,false);
g_affected = ds_list_create()
hit_count = collision_circle_list(x, y, 500, all, false, true, g_affected, true);
/*if enemy_in_range {
		enemy_in_range.phy_speed_y = 0.1
}


