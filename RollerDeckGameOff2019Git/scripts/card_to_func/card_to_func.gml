switch (argument0) {
    case CardType.cSub:
        return Gen_Sub
        break;
    case CardType.cDiv:
        return Gen_Div
        break;
    case CardType.cMult:
        return Gen_Mult
        break;
    case CardType.cPlus:
        return Gen_Add
        break;
    default:
		//show_message("*SCREAMS* \n 'card_to_func' funtion not found")
        return 0
        break;
}