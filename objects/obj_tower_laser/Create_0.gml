tower_hp = 3;

tower_range = y;

global.reload_time_l = room_speed*2;

ready_to_fire = true;

target = noone;

/*
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
physics_fixture_add_point(laser_beam,room_width/2,y+3000)
physics_fixture_add_point(laser_beam,x,y)
physics_fixture_add_point(laser_beam,x+100,y)
physics_fixture_bind(laser_beam,id)
