
draw_sprite(sprite_index, image_index, start_x, start_y);

var info;
for (var i = 1; i < ds_list_size(cards)+1; ++i) {
	info = cards[|i-1]
	draw_surface(global.stack_card_gfx, start_x, start_y-(i*card_thickness) )
}


//draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_green,c_green,c_green,c_green,true)