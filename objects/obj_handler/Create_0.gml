		//initialize variables for camera control
cam_x_start_pos = room_width/10;
cam_y_start_pos = global.ideal_height*2;


		// initialize variables for in-game money system

global.coins = 150;
global.not_enought = false;

		//variables to capture x spawning position
var xx = random_range(200, room_width-200);
var yy = irandom_range(-100,-200);

		// Create HUD buttons test
sprite_adj = global.ideal_width/20
			//
sprite_relative_pos_left = global.ideal_width/2-sprite_adj - global.ideal_width/3
sprite_relative_pos_right = global.ideal_width/2-sprite_adj + global.ideal_width/3



			//Buttons for GUI
global.pow_picked_up = false;  //global variable to indicate power-up picked-up state
right_loaded = false; //global variable to indicate power-up picked-up state
left_loaded = false; 
button_middle = gui_create_button(global.ideal_width/2-sprite_adj,global.ideal_height*0.875,global.ideal_width/10,global.ideal_height/10,"",,,,0,,,0,s_tile_ui);

button_left = gui_create_button(sprite_relative_pos_left,global.ideal_height*0.875,global.ideal_width/10,global.ideal_height/10,"",,,,0,,,0,s_tile_ui);

button_right = gui_create_button(sprite_relative_pos_right,global.ideal_height*0.875,global.ideal_width/10,global.ideal_height/10,"",,,,0,,,0,s_tile_ui);


type = spr_power_up_grav // initial GUI power-up sprite to prevent errors
mass_slow = false;	//variable to control mass slow power-up state
left_button_slow = false	//
left_button_speed = false	// Variables to hold variation of power-up, which changes to true according to power-up type
left_button_grav = false	//
right_button_slow = false	//
right_button_speed = false	// Variables to hold variation of power-up, which changes to true according to power-up type
right_button_grav = false	//

		//creates first asteroid
instance_create_layer(xx,yy,"Instances",obj_asteroid_1);
alarm[0] = 4*room_speed;

		// cooldown of split meteor variable
cd_split_spawn = 20;

		//variable to hold number of waves

wave = 0;
times_to_spawn = 1;

		// creates buttons to build panels
globalvar panel_y_pos ;
panel_y_pos = 600;
instance_create_layer(80,room_height-panel_y_pos,"Instances",obj_plaform_selection)
instance_create_layer(room_width-80,room_height-panel_y_pos,"Instances",obj_plaform_selection)
