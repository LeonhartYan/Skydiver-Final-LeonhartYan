for (var i = ds_list_size(global.clouds) - 1; i >= 0; i--) {
    var cld = ds_list_find_value(global.clouds, i);
    if (!instance_exists(cld)) {
        ds_list_delete(global.clouds, i);
    }
}
if (ds_list_size(global.clouds) < cloud_amount){
	if(!cloud_made){
		var cloud_width = irandom_range(80, room_width -80)
		var cloud_height = irandom_range(400, room_height - 200)
		if(instance_exists(Obj_Cloud)){
		}
		var new_cloud = instance_create_layer(cloud_width, cloud_height, "Instances", Obj_Cloud);
		with(new_cloud)
		{
			var tries = 0;
			while(tries < 1000 && collision_rectangle(x-72, y-72, x+140, y+140, Obj_Cloud, false, true) != noone)
			{
				x  = irandom_range(80, room_width -80)
				y = irandom_range(400, room_height - 200)
				tries += 1
			}
		}
		ds_list_add(global.clouds, new_cloud)
		//show_debug_message(ds_list_size(global.clouds))
		cloud_made = true;
	}
	if(cloud_made){
		cloud_timer ++
	}
	if(cloud_timer >= cloud_duration){
		cloud_timer = 0
		cloud_made = false;
	}
}

portal_timer++;

function _rand_free_pos()
{
    var tx = 0, ty = 0;
    var tries = 0;
    var found = false;

    while (tries < 1000 && !found)
    {
        tx = irandom_range(80,  room_width  - 80);
        ty = irandom_range(220, room_height - 600);

        if (collision_rectangle(
                tx - 72, ty - 72, tx + 140, ty + 140,
                Obj_Cloud, false, true) == noone && collision_rectangle(
                tx - 200, ty - 200, tx + 200, ty + 200,
                Obj_Portal, false, true) == noone)
        {
            found = true;
        }
        else
        {
            tries += 1;
        }
    }
    if (!found) {
        tx = room_width  * 0.5;
        ty = room_height * 0.5;
    }

    return [tx, ty];
}


if (global.start && portal_timer >= portal_interval)
{
    portal_timer = 0;

    if (instance_exists(global.portalA)) {
		instance_destroy(global.portalA);
	}
    if (instance_exists(global.portalB)) {
		instance_destroy(global.portalB);
	}
    var posA = _rand_free_pos();
    global.portalA = instance_create_layer(
        posA[0], posA[1], "Instances", Obj_Portal);
	var posB;
	var generate = false;
	var attempts = 0;

while (!generate && attempts < 1000)
{
    posB = _rand_free_pos();
    var d = point_distance(posA[0], posA[1], posB[0], posB[1]);
    
    if (d >= min_dist && d <= max_dist) generate = true;
    else attempts++;
}

if (!generate)
{
    posB = [ posA[0] + min_dist, posA[1] ];
    posB[0] = clamp(posB[0], 80, room_width - 80);
}
    global.portalB = instance_create_layer(
        posB[0], posB[1], "Instances", Obj_Portal);

    global.portalA.other_Door = global.portalB;
    global.portalB.other_Door = global.portalA;
}



if(global.start){
	cloud_duration = 17;
}