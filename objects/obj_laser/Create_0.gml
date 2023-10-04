show_debug_message(y)


alarm[0] = 60
closest_enemy = instance_nearest(x,y,obj_asteroid_1);


laser_beam = physics_fixture_create();
physics_fixture_set_collision_group(laser_beam,1)
physics_fixture_set_density(laser_beam, 0)
physics_fixture_set_friction(laser_beam, 0)
physics_fixture_set_linear_damping(laser_beam, 0)
physics_fixture_set_angular_damping(laser_beam, 0)
physics_fixture_set_restitution(laser_beam, 0)
physics_fixture_set_sensor(laser_beam,true);
physics_fixture_set_awake(laser_beam, true)
physics_fixture_set_kinematic(laser_beam);

physics_fixture_set_polygon_shape(laser_beam);
physics_fixture_add_point(laser_beam,-50,0)
physics_fixture_add_point(laser_beam,-50,-y)
physics_fixture_add_point(laser_beam,50,-y)
physics_fixture_add_point(laser_beam,50,0)

physics_fixture_bind(laser_beam,id)

draw_set_colour(c_red);

