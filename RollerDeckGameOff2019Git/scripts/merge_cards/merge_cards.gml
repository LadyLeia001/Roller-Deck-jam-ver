
var card1 = argument0
var card2 = argument1

#region
for (var i = 0; i < 30; ++i) {
	var obj = instance_create_depth(x+random(global.card_width),y+random(global.card_height),depth-1,o_dust)

}
#endregion


//show_message(string(card2.Value) + " ... " + string(card1.Value))
var failed = false
switch (card2.Operation) {
	case CardType.cKey:
	case CardType.cDiv:
	case CardType.cSub:
	case CardType.cPlus:
	case CardType.cMult:
	case CardType.cNum:
		switch (card1.Operation) {
		    case CardType.cDiv:
		        card2.Value = real(card2.Value) / real(card1.Value)
		        break;
		    case CardType.cSub:
		        card2.Value -= card1.Value
		        break;
		    case CardType.cPlus:
		        card2.Value += card1.Value
		        break;
		    case CardType.cMult:
		        card2.Value *= card1.Value
		        break;
		    case CardType.cSafe:
		    case CardType.cKey:
		    case CardType.cNum:
		    default: // cant merge
				failed = true
		        break;
		}
	break;
	case CardType.cSafe:
		if (card2.Value == card1.Value && card1.Operation == CardType.cKey){
			//show_message("YOU WIN")
			card2.Operation = CardType.cNum
			room_goto(rm_Level_complete)
		} else {
			failed = true
		}
		break;
	default: // cant merge
		failed = true
		break;
}

if(!failed){ // if it can murge
	card2.drag_state = "mergeing"
	card2.update_spr = true
	
	instance_destroy(card1)
}else{ // if it cant murge
	//show_message("failed mergeing")
	card2.drag_state = "Let_Go"
	card1.drag_state = "Let_Go"
}

//card1.draw_Value_target = card1.Value
//card2.draw_Value_target = card2.Value








