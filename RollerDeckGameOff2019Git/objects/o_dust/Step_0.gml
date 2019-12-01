/// @description  Control Dust


//var _speed = point_distance(0, 0, vx, vy)* global.dt;
//var _dir = point_direction( 0, 0, vx, vy);

//move(_speed,_dir)

x+=vx;
y+=vy;
z+=vz;


vx*=0.9//*(global.dt*60);
vy*=0.9//*(global.dt*60);
vz*=0.9//*(global.dt*60);
vz+=gz //*(global.dt*60)

if( z+vz < 0 ){
	z = 0
	if(vz < 0){
		vz = 0
	}else{
		vz = -vz
	}
}

image_index += _image_speed// * (delta_time)

if(image_index > sprite_get_number(sprite_index)){
	instance_destroy();
}




