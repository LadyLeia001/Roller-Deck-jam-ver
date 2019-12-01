
Indicator_a_target = 0
Warning_a_target = 0
goal_a_target = 0
draw_Value_target = Value


#region card draging
switch (drag_state) {
    case "on_table": // on table
        // do nothing
		//_card_rot_target = 90
		_targetx = TargetSpot.start_x
		_targety = TargetSpot.start_y
		_targetz = (TargetSpot.hight+1)*(card_thickness*0.5)
		if(position_meeting(mouse_x, mouse_y, id)){
			_card_rot_target = -90
			_targetz += card_thickness*2
		}
        break;
    case "Picked_Up": // picked up card
		global.card_held = true
		drag_state = "In_hand"
		_mx = mouse_x
		_my = mouse_y
		_oldx = x
		_oldy = y
		_card_rot_speed = 0.25
        break;
    case "In_hand": // In hand
		update_spr = true
		_targetx = (mouse_x-_mx)+_oldx
		_targety = (mouse_y-_my)+_oldy
		_targetz = (TargetSpot.hight+1)*(card_thickness*0.5)
		var other_card = collision_circle( mouse_x, mouse_y, 5, oCard, false, true );//instance_place(_targetx,_targety,oCard)
		
		//tells you what the 2 cards will make
		if (other_card){
			card_overlay_merge(id, other_card)
		} else {
			Warning_a_target = 0
			Indicator_a_target = 0
		}
		
		_card_rot_target = -90+(_targety-x)
		
        // do nothing
		if(mouse_check_button_released(mb_left)){
			if(other_card){
				merge_cards(id,other_card)
			//}else if(instance_place(_targetx,_targety,oCardSpot)){ //check standed spots
			}else if(collision_circle( mouse_x, mouse_y, 5, oCardSpot, false, true )){ //check standed spots
				var spot = instance_nearest(_targetx,_targety, oCardSpot);
				if(spot){
					if(spot.full != true){
						TargetSpot = spot
					}
				}
			}
			drag_state = "Let_Go"
		}
		_card_rot_target = -90
		_targetz = 10 // z target of hand
        break;
    case "Let_Go": // Let go
		_card_rot_target = -90
		_targetx = TargetSpot.start_x
		_targety = TargetSpot.start_y
		_targetz = ((TargetSpot.hight+1)*card_thickness*0.5)+(card_thickness*0.5)
		global.card_held = false
		break;
	case "mergeing":
		if ( _card_rot > 260 ){
			//flash_a_target = 0
			_card_rot_target = -90
			rot = -90
			drag_state = "Let_Go"
			_targetz = ((TargetSpot.hight+1)*card_thickness*0.5)
		} else {
			rot = -90
			//flash_a_target = 1
			_card_rot_target = 360+-90
			_targetz = ((TargetSpot.hight+1)*card_thickness*0.5)+25
		}
		break;
    default:
        //show_message("the state of this cards drag state is wrong and you need to fix it "+(drag_state))
		drag_state = "on_table"
        break;
}
#endregion

_card_rot = lerp( _card_rot, _card_rot_target, _card_rot_speed )
_card_rot = _card_rot%360
x = lerp( x, _targetx, _card_rot_speed )
y = lerp( y, _targety, _card_rot_speed )
//_targetz += ( sin( ( (global.worldtime*0.1) + (point_distance(x, y, mouse_x, mouse_y)*0.1) ) )*20 ) //wave idea
z = lerp( z, _targetz, _card_rot_speed )

flash_a = lerp( flash_a, flash_a_target, flash_a_apeed )
Warning_a = lerp( Warning_a, Warning_a_target, 0.15 )
Indicator_a = lerp( Indicator_a, Indicator_a_target, 0.15 )
goal_a = lerp(goal_a, goal_a_target, 0.15)


draw_Value = lerp( draw_Value, draw_Value_target, 0.15)

depth = -(y+_targetz+global.card_height+(z*15))+( (drag_state == "In_hand") * -1000)

#region card color
switch (Operation) {
    case CardType.cKey:
		image_blend = c_yellow
        break;
    case CardType.cSafe:
		image_blend = c_yellow
        break;
    case CardType.cSub:
		image_blend = c_blue
        break;
    case CardType.cPlus:
		image_blend = c_red
        break;
    case CardType.cMult:
		image_blend = c_yellow
        break;
    case CardType.cDiv:
		image_blend = c_yellow
        break;
    case CardType.cNum:
    default:
		image_blend = c_white
        break;
}
#endregion



Value = real(Value) // fix dumb bugs

