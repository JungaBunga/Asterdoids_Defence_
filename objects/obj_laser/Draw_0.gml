
closest_enemy = instance_nearest(x,y,obj_asteroid_1);
physics_draw_debug();

/*if instance_exists(obj_asteroid_1){
var point = collision_line_find_nearest_point(x, y, closest_enemy.x, closest_enemy.y, 1, obj_asteroid_1, true);

draw_line_width_color(x, y, point[0], point[1], 2, c_red, c_red);
draw_circle_color(point[0], point[1], 3, c_red, c_red, false);





if point != [] {
	image_yscale += 0.01;
	closest_enemy.hp -= 0.01
	
	
	}
}
*/




//draw laser pointer sprite
draw_self();
