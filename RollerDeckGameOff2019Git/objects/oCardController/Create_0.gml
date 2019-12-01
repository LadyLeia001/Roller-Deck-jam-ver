global.fall_timer = 0
global.zg = -1

#region setup
draw_set_font(m5x7)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

global.card_held = false
has_saved_undo = false

global.stack_card_gfx = -1
global.stack_card_shdow_gfx = -1

global.card_width  = sprite_get_width (sCard_base)
global.card_height = sprite_get_height(sCard_base)


global.worldtime = 0

fade = 1
fade_target = 0

audio_stop_sound(mGamePlay)
audio_play_sound(mGamePlay, 10, true);
audio_sound_gain(mGamePlay, 0, 0);
audio_sound_gain(mGamePlay, 1, 2.5*1000);
#endregion


randomize()

oprations = [CardType.cPlus , CardType.cSub, CardType.cMult, CardType.cDiv]
card_count  = irandom_range(3,5)		//how meny cards needed to be genrated
red_herring = irandom_range(2,3)		//how meny red herring cards needed to be genrated

key_val  = irandom_range(4,20)			//start value
safe_val = irandom_range(4,20)			//end value

if (key_val == safe_val){
	room_restart()
}

num_max = 25			//highist number posible
num_min = 2				//smallist number posible


global.card_stack = GenrateCardStack(oprations, card_count, red_herring, key_val, safe_val, num_max, num_min)


undo_count = 0
undo = []
undo_stack = 0





