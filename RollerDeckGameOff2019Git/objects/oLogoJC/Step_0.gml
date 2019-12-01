timer += delta_time/1000000

if(timer > timer_max-0.1){
	oTitleController.fade_target = 1
}
if(timer > timer_max){
	oTitleController.fade_target = 0
	//instance_activate_all()
	instance_activate_object(oLogo);
	instance_destroy()
}