

		// every 3-4 seconds creates an instance of the asteroid
if(room == rm_game){
	repeat(times_to_spawn){
		var xx = irandom_range(100, room_width-100);
		var yy = irandom_range(-50,-300);
		asteroid_to_spawn = choose(obj_asteroid_1, obj_asteroid_small);
		instance_create_layer(xx,yy,"Instances",asteroid_to_spawn);
			
		cd_split_spawn -=1
		if cd_split_spawn <= 0{
		
		instance_create_layer(xx,yy,"Instances",obj_asteroid_split);
		cd_split_spawn = 10;
		}
	
	

	alarm[0] = random_range(60,120);
	
	}
	wave += 1;
	if wave >= 20 {
		times_to_spawn +=1
		wave = 0;
	}
	
}

