enum state{
	launch, jump, down, fall, jump_pre, dead
}

jump_limit = 100
jump_height = 0
launch_limit = 850
launched = false;
depth = -1;

image_speed = 0

current_state = state.launch
input_cooldown = 0;
launch_acceleration = 1;

jump_acceleration = 1;
jump_max_vel = 15;
launch_vel = 40;
jump_init_impulse = 20;
jump_timer = 0;
jump_duration = 10;

fall_gravity = 1;
vertical_velocity = 0;
horizontal_velocity = 0;
falling_change_vel = 5;
falling_max_vel = 40;

left = 0;
right = 0;
up = 0;
down = 0;
shoot = false;
reload_btn = false;
strata = false;

reload = false;
rld_timer = 0;
rld_duration = 90;

fast_reload = false;
frld_timer = 0;
frld_duration = 30;


gun = noone;
ammo = 5;
max_ammo = 5
 
walk_acceleration = 2.5;
walk_max_vel = 25;
obstacle = 65
dead = false;
resp_timer = 0;
resp_duration = 60;
respawn = false
randomize()

point = false;
point_timer = 0;
point_duration = 1;

point_strata = false;
point_strata_timer = 0;
point_strata_duration = 1;


invensible = false;
invi_timer = 0;
invi_duration = 2;
freeze = false;
frez_timer = 0;
frez_duration = 30;
shoot_cooldown = 0;
shoot_cooldown_duration = 10;

wall = false;
wall_timer = 0;
wall_duration = 10;

armed = false;

command_input = "";
command_timeout = 120;
command_timer = 0;

orbital_strike = "ASDWW"
machine_gun = "SASWD"
orbital_flame = "DDSADW"
gatling_sentry = "SWDA"
empbomb = "SWASWDSW"

cmd_list = [
    orbital_strike,
    machine_gun,
    orbital_flame,
    gatling_sentry,
    empbomb
];

name_list = [
    "Orbital Strike",
    "Machine Gun",
   "Orbital Flame",
    "Sentry Turret",
    "EMP Bomb"
];

teleport_cooldown = 0;

mg = false;