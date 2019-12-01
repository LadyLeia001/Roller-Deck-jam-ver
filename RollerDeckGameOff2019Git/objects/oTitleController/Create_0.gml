global.fall_timer = 0
global.fall_timer_mult = 1
timer = 0
timer_max = 3.5


bg_col = make_color_rgb(59, 65, 109)

global.card_width  = sprite_get_width (sCard_base)
global.card_height = sprite_get_height(sCard_base)

fade = 1
fade_target = 0

audio_stop_sound(mIntoTitle); // just in case
audio_play_sound(mIntoTitle, 10, true);

depth = 399

is_menu = false

global.zg = -1

#region sound stuff
var num = audio_get_listener_count();
for( var i = 0; i < num; i++;)
   {
   var info = audio_get_listener_info(i);
   audio_set_master_gain(info[? "index"], 4);
   ds_map_destroy(info);
   }
#endregion