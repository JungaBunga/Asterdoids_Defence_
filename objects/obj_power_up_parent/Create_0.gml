randomise();



global.pow_up_speed = false
global.pow_up_slow = false
global.pow_up_grav = false
type = irandom_range(1,3)
show_debug_message(type)
if type == 1 {
	//global.pow_up_speed = true
	sprite_index = spr_power_up_speed
}
if type == 2 {
	//global.pow_up_slow = true
	sprite_index = spr_power_up_slow
}
if type == 3{
	//global.pow_up_grav = true
	sprite_index = spr_power_up_grav
}

