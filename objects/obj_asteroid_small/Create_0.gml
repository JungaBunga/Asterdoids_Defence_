
		// variables to hold randomised properties of the asteroids

phy_speed_y = random_range(2,8);
direction = irandom_range(0,359);
phy_linear_damping = random_range(0.5,3);
phy_rotation = irandom_range(0,359);
phy_angular_velocity = irandom_range(1,100);
phy_linear_velocity_y = irandom_range(1,50);
gravity = 0;

		// HP control based on size - the bigger asteroid the more hp it has
hp = random_range(4,5);

/*
image_xscale += irandom_range (0.2, 1.25);
image_yscale = image_xscale;
if hp <= 0{
	instance_destroy();
}

 if (image_yscale >= image_yscale+ 0.75)
		{
			hp +=2
		}

 if (image_yscale >= image_yscale+ 1)
		{
			hp +=3
		}
		*/


		
		// variables that hold random direction for x and y when entering the room
		
x_direction = random_range(0,room_width)
y_direction = random_range(-15,15);

set_rot_dir = choose(0,1)

if (y_direction > 10 or y_direction < -10){
	phy_speed_y = choose(5,10,15)
}

		//impulse to give extra speed and rotation
physics_apply_impulse(0,0,choose(0,1080),y_direction);
		//applies force at the entrance to the room to randomize its path)
constant_pressure_left = random_range(-10,-5)
constant_pressure_right = random_range(5,10)


if(set_rot_dir == 1){
	
	physics_apply_force(0,0,constant_pressure_left,0);

	}
else{
	physics_apply_force(0,0,constant_pressure_right,0);

}


		// adjust the centre of mass fo each object to create more realistic hurling
spr_width = sprite_get_width(spr_asteroid_2);
spr_height = sprite_get_height(spr_asteroid_2);
x_mass_adj = random_range(-20,20);
y_mass_adj = random_range(-20,20);
physics_mass_properties(phy_mass,x_mass_adj,y_mass_adj, phy_inertia)

		// initial pause before spawning more asteroids
alarm[0] = 6*room_speed;

		//Smooth asteroids movement
acceleration = random_range(0.1,0.4);

spr_id = object_get_sprite(object_index)

start_ang = layer_sprite_get_angle(spr_id)

sprite_set_speed(spr_id,0, spritespeed_framespersecond);

img_rand = 1

		//Randomized chance of getting a power-up on spawn

chance = random_range(1,100)




 
 
