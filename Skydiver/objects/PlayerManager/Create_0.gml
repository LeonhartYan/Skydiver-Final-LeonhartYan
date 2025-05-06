resp_timer = 0;
resp_duration = 120;
randomize()
show_timer = 0;
show_duration = 600;
audio = false
increasing = true;
if(global.testmode){
	global.cost_list1 = [-99, -99, -99, -99, -99];
	global.cost_list2 = [-99, -99, -99, -99, -99];
}else{
	global.cost_list1 = [5, 5, 5, 5, 45];
	global.cost_list2 = [5, 5, 5, 5, 45];
}