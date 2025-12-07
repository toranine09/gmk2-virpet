/// @description timer for decreasing clean/food/play

stat_clean--;
stat_food--;
stat_play--;

var pet_status = string_concat(stat_concern, " - clean: ", stat_clean, " feed: ", stat_food, " play: ", stat_play);
show_debug_message(pet_status);

alarm[0] = room_speed/2;