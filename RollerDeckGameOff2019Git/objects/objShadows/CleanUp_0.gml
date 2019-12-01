// Free the surface from memory when it's not needed anymore
if(surface_exists(shadows)){
	surface_free(shadows);
}