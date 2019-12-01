z = random_range(20,100)
card_surf = -1

vx = ((room_width *0.5)-x)*random_range(0.01,0.1)
vy = ((room_height*0.5)-y)*random_range(0.01,0.1)

zv = 0
zf = 0.5
ground = 0

//point_direction()

image_angle = random(360)
vr = random_range(-50,50)
vf = 0.9


col_Border = c_white
col_Num = c_white
col_Operation = c_white


Operation = irandom_range(CardType.cSub, CardType.cDiv)
Value = irandom_range(2,25)



fall_timer_max = random_range(5,50)

depth = ((-z*2)+-y)*0.01