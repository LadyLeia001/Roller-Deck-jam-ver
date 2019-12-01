#region //setup

update_spr = false

surf = -1
card_surf = -1

TargetSpot = noone // the spot that the card is in this should always be set

locked = false //if it can move or not

z = 10

_oldx = 0
_oldy = 0
_targetx = x
_targety = y
_targetz = z

//mouse
_mx = 0
_my = 0

_card_width  = sprite_get_width (sprite_index)
_card_height = sprite_get_height(sprite_index)
_card_rot_speed = 0.125
_card_rot_target = 90//pi*0.5
_card_rot = _card_rot_target

drag_state = "on_table"
#endregion

#region // card infomation
Operation = CardType.cNum
Value = 666
draw_Value = Value
draw_Value_target = draw_Value


#endregion

#region // card col
col_Border = c_white
col_Num = c_white
col_Operation = c_white

flash_a = 0
flash_a_target = 0
flash_a_apeed = 0.5

Warning_a = 0
Warning_a_target = 0

Indicator_a = 0
Indicator_a_target = 0

goal_a = 0
goal_a_target = 0

#endregion





















