

if(global.fall_timer > fall_timer_max){
	
	if(z+zv < ground /*&& sign(global.zg) == -1*/ ){
		zv = -zv*zf
	} else {
		zv +=global.zg
		z+=zv
	}
	
	vx = vx*vf
	vy = vy*vf
	vr = vr*vf

	x += vx
	y += vy
	image_angle +=vr
}