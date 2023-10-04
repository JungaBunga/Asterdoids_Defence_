/// @description Insert description here
// You can write your code in this editor

if hp <= 0 {
	instance_destroy(self);
	
	mid_t = instance_position(x,y,obj_tower_parent);
	right_t = instance_position(x+sprite_width/3,y,obj_tower_parent)
	left_t = instance_position(x-sprite_width/3,y,obj_tower_parent)
	
	mid_bub = instance_position(x,y,obj_tow_placement);
	right_bub = instance_position(x+sprite_width/3,y,obj_tow_placement);
	left_bub = instance_position(x-sprite_width/3,y,obj_tow_placement);
	
	
	if instance_position(x,y,obj_tower_parent){
	instance_destroy(mid_t)
	
	}
	if instance_position(x+sprite_width/3,y,obj_tower_parent){
	instance_destroy(right_t)
	
	}
	if instance_position(x-sprite_width/3,y,obj_tower_parent){
	instance_destroy(left_t)
	}
	
	if instance_position(x,y,obj_tow_placement){
		instance_destroy(mid_bub)
	}
	if instance_position(x+sprite_width/3,y,obj_tow_placement){
	instance_destroy(right_bub)
	}
	if instance_position(x-sprite_width/3,y,obj_tow_placement){
		instance_destroy(left_bub)
	}
	
	
}