
/*if instance_exists(obj_tower_laser){
x = obj_tower_laser.x
y = obj_tower_laser.y
}*/


closest_enemy = instance_nearest(x,y,obj_asteroid_1);

image_yscale += 0.01;




/*
if instance_exists(obj_asteroid_1){
gravity_direction = point_direction(x,y,closest_enemy.x,closest_enemy.y)
}

/*var max_length = y
var enemy_in_range = collision_circle(x,y, tower_range, obj_asteroid_1,false,false);

/*if enemy_in_range {
for (i= 0; i< max_length; i++){
	xEnd = x+ lengthdir_x(i,gravity_direction)
	yEnd = y+ lengthdir_y(i,gravity_direction)
	length_laser = i;

}
}

