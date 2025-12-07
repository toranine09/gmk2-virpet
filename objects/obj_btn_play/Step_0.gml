/// @description on click start playing

var frisbee = obj_pet.stat_play;

if (frisbee < 99) {
	if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, obj_btn_play)) {
		image_blend = c_grey;
		obj_pet.stat_concern = "playing";
	};
	image_blend = c_white;
} else if (frisbee >= 99) {
	image_blend = c_dkgrey;
};

if (obj_pet.stat_concern = "dead") {
	image_blend = c_dkgrey;
};