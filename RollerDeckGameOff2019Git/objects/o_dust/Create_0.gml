z = 0

image_speed=0
dust_mode = "normal" // "normal" "RainbowDrops"

vx = random_range(-0.75,0.75);
vy = random_range(-0.75,0.75);
vz = random_range(-0.75,0.75);
gz = -0.1;

_image_speed = random_range(1/4,1/8);
image_index = random(5);
sprite_index = choose(s_dust_A,s_dust_B);
depth = -y;