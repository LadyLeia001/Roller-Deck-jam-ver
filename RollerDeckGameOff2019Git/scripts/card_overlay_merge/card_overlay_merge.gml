
var card1 = argument0
var card2 = argument1

var out = 0;

var failed = false
var Goal = false
switch (card2.Operation) {
	case CardType.cKey:
	case CardType.cDiv:
	case CardType.cSub:
	case CardType.cPlus:
	case CardType.cMult:
	case CardType.cNum:
		switch (card1.Operation) {
		    case CardType.cDiv:
		        out = card2.Value / card1.Value
		        break;
		    case CardType.cSub:
		        out = real(card2.Value - card1.Value)
		        break;
		    case CardType.cPlus:
		        out = real(card2.Value + card1.Value)
		        break;
		    case CardType.cMult:
		        out = real(card2.Value * card1.Value)
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
	default: // cant merge
		if (card2.Value == card1.Value && card1.Operation == CardType.cKey){
			Goal = true
		} else {
			failed = true
		}
		break;
}



if (failed){
	Indicator_a_target = 0
	Warning_a_target = 1
} else {
	if (Goal){
		goal_a_target = 1
	}else{
		Indicator_a_target = 1
	}
}

if (out){
	draw_Value_target = out
}



