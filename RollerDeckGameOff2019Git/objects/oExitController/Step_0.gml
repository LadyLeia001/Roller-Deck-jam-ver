global.fall_timer += (delta_time/100000)*global.fall_timer_mult

timer += delta_time/1000000

fade = lerp(fade, fade_target, 0.1)
