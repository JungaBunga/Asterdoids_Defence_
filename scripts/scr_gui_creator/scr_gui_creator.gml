#macro GUI_ANIM_SPEED 10
#macro HOVER_ALPHA 0

function graph_value(_x,_y) constructor{
	x = _x;
	y = _y;
	anim_value = 0;
}

enum gui_kind{
	button,
	radiobutton,
	checkbox,
	bargraph
}
enum gui_align{
	left,
	right,
	top,
	bottom,
	labelcenter,
	labelnone
}

global.gui_creator_id = 0;
global.gui_creator_elements = [];

function _gui_creator_button(_x,_y,_width,_height,_label,_label_color,_label_font,_background_color,_background_alpha,_outline_width,_outline_color,_outline_alpha,_icon,_icon_pos,_icon_color) constructor{
	element_id = global.gui_creator_id;
	global.gui_creator_id++;
	
	kind = gui_kind.button;
	x = _x;
	y = _y;
	width = _width;
	height = _height;
	label = _label;
	label_color = _label_color;
	label_font = _label_font;
	bg_color = _background_color;
	bg_alpha = _background_alpha;
	outline_width = _outline_width;
	outline_color = _outline_color;
	outline_alpha = _outline_alpha;
	icon = _icon;
	icon_pos = _icon_pos;
	icon_color = _icon_color;
	
	hover = false;
	pressed = false;
	animating = false;
	offset = 0;
	
	function get_kind(){
		return kind;
	}
	function check_pressed(){
		var r = pressed;
		pressed = -1;
		return r;
	}
	function check_hover(){
		var r = hover;
		hover = -1;
		return r;
	}
	
	function render(){
		pressed = false;
		hover = point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),x,y,x+width,y+height);
		pressed = hover && mouse_check_button_pressed(mb_left);
		
		if outline_width > 0{
			draw_sprite_ext(spr_rect_1px,0,x,y,outline_width,height,0,outline_color,outline_alpha);
			draw_sprite_ext(spr_rect_1px,0,x+outline_width,y,width-outline_width,outline_width,0,outline_color,outline_alpha);
			draw_sprite_ext(spr_rect_1px,0,x+outline_width,y+height-outline_width,width-outline_width,outline_width,0,outline_color,outline_alpha);
			draw_sprite_ext(spr_rect_1px,0,x+width-outline_width,y,outline_width,height,0,outline_color,outline_alpha);
		}
		draw_sprite_ext(spr_rect_1px,0,x+outline_width,y+outline_width,width-2*outline_width,height-2*outline_width,0,bg_color,bg_alpha);
		
		var count = 0;
		if font_exists(label_font) draw_set_font(label_font);
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		var label_on = false;
		var label_w = 0;
		var label_h = 0;
		if label != ""{
			count++;
			label_on = true;
			label_w = string_width(label);
			label_h = string_height(label);
		}
		
		var sprite_on = false;
		var spr_w = 0;
		var spr_h = 0;
		if sprite_exists(icon){
			count++;
			sprite_on = true;
			spr_w = sprite_get_width(icon);
			spr_h = sprite_get_height(icon);
		}
		
		var w_spacer = (width-label_w-spr_w)/(count+1);
		var h_spacer = (height-label_h-spr_h)/(count+1);
		
		var spr_x = 0;
		var spr_y = 0;
		var label_x = 0;
		var label_y = 0;
		
		switch(icon_pos){
			case gui_align.left:
				spr_x = sprite_on ? x+w_spacer : x;
				spr_y = sprite_on ? y+height/2-spr_h/2 : y;
				label_x = spr_x+spr_w+w_spacer;
				label_y = y+height/2-label_h/2;
			break;
			case gui_align.right:
				label_x = label_on ? x+w_spacer : x;
				label_y = label_on ? y+height/2-label_h/2 : y;
				spr_x = label_x+label_w+w_spacer;
				spr_y = y+height/2-spr_h/2;
			break;
			case gui_align.top:
				spr_x = sprite_on ? x+width/2-spr_w/2 : x;
				spr_y = sprite_on ? y+h_spacer : y;
				label_x = x+width/2-label_w/2;
				label_y = spr_y+spr_h+h_spacer;
			break;
			case gui_align.bottom:
				label_x = label_on ? x+width/2-label_w/2 : x;
				label_y = label_on ? y+h_spacer : y;
				spr_x = x+width/2-spr_w/2;
				spr_y = label_y+label_h+h_spacer;
			break;
		}
		
		if label != ""{
			draw_set_color(label_color);
			draw_text(label_x,label_y,label);
		}
		
		if sprite_exists(icon){
			draw_sprite_ext(icon,0,spr_x,spr_y,1,1,0,icon_color,1);
		}
		
		if animating{
			var bmode = gpu_get_blendmode();
			var alpha = draw_get_alpha();
			gpu_set_blendmode(bm_add);
			draw_set_alpha(0.5);
			draw_rectangle_color(x,y,x+offset-1,y+height-1,c_black,c_grey,c_white,c_black,false);
			gpu_set_blendmode(bmode);
			draw_set_alpha(alpha);
			
			offset+=GUI_ANIM_SPEED/100*width;
			if offset >= width{
				animating = false;
				offset = 0;
			}
		}
		
		if pressed{
			animating = false;
			offset = 0;
		}
		
		if hover draw_sprite_ext(spr_rect_1px,0,x,y,width,height,0,c_white,HOVER_ALPHA);
		
	}
}

function _gui_creator_multiplebutton(_x,_y,_radio_button,_max_selected,_items,_radius,_color,_outline_width,_outline_color,_label_color,_label_font) constructor{
	function clear_selected(){
		selected = array_create(array_length(items),false);
		sel_count = 0;
	}
	
	element_id = global.gui_creator_id;
	global.gui_creator_id++;
	
	kind = _radio_button ? gui_kind.radiobutton : gui_kind.checkbox;
	x = _x;
	y = _y;
	radius = _radius;
	center_x = x+radius;
	center_y = y+radius;
	outline_width = _outline_width;
	outline_color = _outline_color;
	label_color = _label_color;
	label_font = _label_font;
	bg_color = _color;
	
	hover_index = -1;
	pressed_index = -1;
	items = _items;
	max_selected = _radio_button ? 1 : _max_selected;
	clear_selected();
	
	hover = false;
	pressed = false;
	animating = false;
	offset = 0;
	
	function set_selected(item_id,value){
		pressed_index = item_id;
		
		if value && kind == gui_kind.radiobutton clear_selected();
		
		var old = selected[item_id];
		if !old && value sel_count++;
		if old && !value sel_count--;
		
		if sel_count <= max_selected selected[item_id] = value;
		else sel_count = max_selected;
		
		sel_count = max(sel_count,0);
	}
	function get_kind(){
		return kind;
	}
	function get_pressed_index(){
		return pressed_index;
	}
	function get_hover_index(){
		return hover_index;
	}
	function get_selected_state(item_id){
		return selected[item_id];
	}
	function check_pressed(){
		var r = pressed;
		pressed = -1;
		return r;
	}
	function check_hover(){
		var r = hover;
		hover = -1;
		return r;
	}
	
	function render(){
		pressed = false;
		hover_index = -1;
		var pressed_id = -1;
		var l = array_length(items);
		var yp = center_y;
		for(var i=0;i<l;i++){
			if hover_index == -1{
				hover = point_in_circle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),center_x,yp,radius);
				pressed = hover && mouse_check_button_pressed(mb_left);
				
				if hover hover_index = i;
				if pressed{
					pressed_id = i;
					var state = selected[i];
					set_selected(i,kind == gui_kind.radiobutton ? true : !state);
					
					if kind == gui_kind.radiobutton && !state && !animating animating = true;
				}
			}
			
			draw_set_alpha(1);
			draw_set_color(hover_index == i ? merge_colour(outline_color,c_white,0.2) : outline_color);
			draw_circle(center_x,yp,radius,false);
			draw_set_color(bg_color);
			draw_circle(center_x,yp,radius-outline_width,false);
			
			var max_size = radius/2;
			
			if kind == gui_kind.radiobutton && animating{
				if selected[i]{
					draw_set_color(hover_index == i ? merge_colour(outline_color,c_white,0.2) : outline_color);
					draw_circle(center_x,yp,animating ? offset : max_size,false);
				}
				
				offset+=GUI_ANIM_SPEED/100*max_size;
				if offset >= max_size{
					animating = false;
					offset = 0;
				}
			}
			else{
				if selected[i]{
					draw_set_color(outline_color);
					draw_circle(center_x,yp,max_size,false);
				}
			}
			
			var halign = draw_get_halign();
			var valign = draw_get_valign();
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			draw_set_color(label_color);
			if font_exists(label_font) draw_set_font(label_font);
			if items[i] != "" draw_text(center_x+2*radius,yp,items[i])
			
			draw_set_halign(halign);
			draw_set_valign(valign);
			
			yp += 3*radius;
		}
	}
}

function _gui_creator_graph(_kind,_x,_y,_width,_height,_bar_width,_background_color,_values_array,_colors_array,_outline_width,_outline_color,_label_color,_label_font,_label_align) constructor{
	
	function get_max_value(){
		var l = array_length(values);
		var m = -infinity;
		
		if l <= 0 return m;
		
		for(var i=0;i<l;i++){
			var v = values[i].y;
			m = max(m,v);
		}
		return m;
	}
	function get_min_value(){
		var l = array_length(values);
		var m = infinity;
		
		if l <= 0 return m;
		
		for(var i=0;i<l;i++){
			var v = values[i].y;
			m = min(m,v);
		}
		return m;
	}
	function reload_values(animate=false){
		min_value = get_min_value();
		max_value = get_max_value();
		if animate animating = true; else stop_animation();
	}
	function stop_animation(){
		var l = array_length(values);
		for(var i=0;i<l;i++){
			values[i].anim_value = values[i].y;
		}
		animating = false;
	}
	
	element_id = global.gui_creator_id;
	global.gui_creator_id++;
	
	kind = _kind;
	x = _x;
	y = _y;
	width = _width;
	height = _height;
	y_label_placement = 50;
	values = _values_array;
	reload_values();
	colors = _colors_array;
	bar_width = _bar_width;
	bg_color = _background_color;
	outline_width = _outline_width;
	outline_color = _outline_color;
	label_color = _label_color;
	label_font = _label_font;
	label_align = _label_align;
	
	pressed_index = -1;
	hover_index = -1;
	
	hover = false;
	pressed = false;
	animating = true;
	
	function start_animation(){
		reset_animation();
		animating = true;
	}
	function reset_animation(){
		var l = array_length(values);
		for(var i=0;i<l;i++){
			values[i].anim_value = 0;
		}
	}
	function get_kind(){
		return kind;
	}
	function get_hover_index(){
		return hover_index;
	}
	function get_pressed_index(){
		return pressed_index;
	}
	function check_pressed(){
		var r = pressed;
		pressed = -1;
		return r;
	}
	function check_hover(){
		var r = hover;
		hover = -1;
		return r;
	}
	
	function process_animation(){
		var complete = true;
		
		var l = array_length(values);
		for(var i=0;i<l;i++){
			var v1 = values[i].anim_value;
			var v2 = values[i].y;
			v1 = lerp(v1,v2,GUI_ANIM_SPEED/150);
			
			values[i].anim_value = abs(v2-v1) < 0.001*max_value ? v2 : v1;
			
			if complete && (v2 != v1) complete = false;
		}
		
		return complete;
	}
	
	function get_next_color(item_id){
		if !is_array(colors) return colors;
		var l = array_length(colors);
		return colors[item_id mod l];
	}
	
	function get_gradation(){
		var p = power(10,floor(log10(max_value/10)));
		if p == 0 p = 1;
		var max_v = floor(max_value/p)*p+p;
		
		var temp_v = min(min_value,0);
		var temp_sign = sign(temp_v);
		temp_v = abs(temp_v);
		var p = power(10,floor(log10(temp_v/10)));
		if p == 0 p = 1;
		var min_v = floor(temp_v/p)*p+p;
		min_v *= sign(temp_sign);
		
		var count = max(2,(height div y_label_placement));
		
		var r = [];
		for(var i=0;i<count;i++) array_insert(r,0,lerp(min_v,max_v,i/(count-1)));
		return r;
	}
	
	function render(){
		if animating animating = !process_animation();
		
		draw_set_alpha(1);
		
		switch(kind){
			case gui_kind.bargraph:
				render_bar();
			break;
		}
	}
	
	function render_bar(){
		pressed = false;
		hover_index = -1;
		pressed_index = -1;
		
		if !is_undefined(bg_color) draw_sprite_ext(spr_rect_1px,0,x,y,width,height,0,bg_color,1);
		
		if font_exists(label_font) draw_set_font(label_font);
		
		var g = get_gradation();
		var l = array_length(g);
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		for(var i=0;i<l;i++){
			var yp = g[i]/g[0]*height;
			if yp < 0 or yp > height continue;
			
			var centery = y+height-yp;
			
			draw_set_color(label_color);
			draw_text(x-5,centery,g[i]);
			
			draw_set_color(outline_color);
			draw_sprite_ext(spr_rect_1px,0,x,centery,width,outline_width,0,draw_get_color(),draw_get_alpha());
		}
		
		var line = true;
		
		var l = array_length(values);
		repeat(2){
			var sidebar_width = 0;
			var target_width = width-sidebar_width;
			var target_height = height;
			var dist = target_width/(array_length(values)+1);
			var xp = x+sidebar_width+dist-bar_width/2;
			var yp = y+height;
		
			for(var i=0;i<l;i++){
				var v = values[i].anim_value;
				var h = floor(v/g[0]*target_height);
			
				if !line{
					if hover_index == -1{
						hover = point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),xp,yp-h,xp+bar_width,yp);
						pressed = hover && mouse_check_button_pressed(mb_left);
				
						if hover hover_index = i;
						if pressed pressed_index = i;
					}
				}
				
				if line draw_sprite_ext(spr_rect_1px,0,x,yp-h,xp-x,outline_width,0,outline_color,0.5);
				
				if !line{
					var color = get_next_color(i);
					draw_sprite_ext(spr_rect_1px,0,xp,yp-h,bar_width,h,0,outline_color,1);
					draw_sprite_ext(spr_rect_1px,0,xp+outline_width,yp-h+outline_width,bar_width-outline_width*2,h-outline_width,0,hover_index == i ? merge_colour(color,c_white,HOVER_ALPHA) : color,1);
			
					draw_set_color(label_color);
					draw_set_halign(fa_center);
					draw_set_valign(fa_top);
					draw_text(xp+bar_width/2,yp+5,values[i].x);
			
					if (hover_index == i){
						var label = values[i].y;
				
						var labelx = xp+bar_width/2;
						var labely = yp-h/2;
						var centerx = labelx;
						var centery = labely;
						var strw = string_width(label)/2;
						var strh = string_height(label)/2;
						draw_set_halign(fa_center);
						draw_set_valign(fa_middle);
						switch(label_align){
							case gui_align.left:
								draw_set_halign(fa_right);
								labelx = xp-5;
								centerx = labelx-strw;
							break;
							case gui_align.right:
								draw_set_halign(fa_left);
								labelx = xp+bar_width+5;
								centerx = labelx+strw;
							break;
							case gui_align.top:
								draw_set_valign(fa_bottom);
								labely = yp-h-5;
								centery = labely-strh;
							break;
							case gui_align.bottom:
								draw_set_valign(fa_top);
								labely = yp+5;
								centery = labely+strh;
							break;
						}
				
						if label_align != gui_align.labelnone{
							var max_size = max(strw,strh);
							draw_set_color(outline_color);
							draw_circle(centerx,centery,max_size+3,false);
							draw_set_color(color);
							draw_circle(centerx,centery,max_size+2,false);
							draw_set_color(label_color);
							draw_text(labelx,labely,label);
						}
					}
				}
				
				xp += dist;
			} //END FOR
			
			if line line = false;
		} //END REPEAT
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
}

function gui_create_button(_x,_y,_width,_height,_label,_label_color=c_black,_label_font=-1,_background_color=c_white,_background_alpha=1,_outline_width=1,_outline_color=c_black,_outline_alpha=1,_icon=-1,_icon_pos=gui_align.left,_icon_color=c_white){
	var button = new _gui_creator_button(_x,_y,_width,_height,_label,_label_color,_label_font,_background_color,_background_alpha,_outline_width,_outline_color,_outline_alpha,_icon,_icon_pos,_icon_color);
	array_push(global.gui_creator_elements,button);
	return button;
}

function gui_create_radiobutton(_x,_y,_items_array,_radius=10,_color=c_white,_outline_width=1,_outline_color=c_black,_label_color=c_black,_label_font=-1){
	var radiobutton = new _gui_creator_multiplebutton(_x,_y,true,1,_items_array,_radius,_color,_outline_width,_outline_color,_label_color,_label_font);
	array_push(global.gui_creator_elements,radiobutton);
	return radiobutton;
}

function gui_create_checkbox(_x,_y,_items_array,_max_selected=1,_radius=10,_color=c_white,_outline_width=1,_outline_color=c_black,_label_color=c_black,_label_font=-1){
	var radiobutton = new _gui_creator_multiplebutton(_x,_y,false,_max_selected,_items_array,_radius,_color,_outline_width,_outline_color,_label_color,_label_font);
	array_push(global.gui_creator_elements,radiobutton);
	return radiobutton;
}

function gui_create_bar_graph(_x,_y,_width,_height,_bar_width=30,_background_color=undefined,_values_array,_colors_array=c_white,_outline_width=1,_outline_color=c_black,_label_color=c_black,_label_font=-1,_label_align=gui_align.labelcenter){
	var bargraph = new _gui_creator_graph(gui_kind.bargraph,_x,_y,_width,_height,_bar_width,_background_color,_values_array,_colors_array,_outline_width,_outline_color,_label_color,_label_font,_label_align);
	array_push(global.gui_creator_elements,bargraph);
	return bargraph;
}

function gui_delete(element_id){
	var l = array_length(global.gui_creator_elements);
	for(var i=0;i<l;i++){
		if global.gui_creator_elements[i] == element_id{
			if is_struct(global.gui_creator_elements[i]){
				delete global.gui_creator_elements[i];
				array_delete(global.gui_creator_elements,i,1);
				break;
			}
		}
	}
}

function gui_delete_all(){
	var l = array_length(global.gui_creator_elements);
	for(var i=0;i<l;i++){
		if is_struct(global.gui_creator_elements[i]) delete global.gui_creator_elements[i];
	}
	global.gui_creator_elements = [];
}

function gui_render_all(){
	var l = array_length(global.gui_creator_elements);
	for(var i=0;i<l;i++){
		global.gui_creator_elements[i].render();
	}

}