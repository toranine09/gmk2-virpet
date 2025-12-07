/// @description on click start cleaning

var soap = obj_pet.stat_clean;

if (soap < 99) {
	if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, obj_btn_clean)) {
		image_blend = c_grey;
		obj_pet.stat_concern = "cleaning";
	};
	image_blend = c_white;
} else if (soap >= 99) {
	image_blend = c_dkgrey;
};

if (obj_pet.stat_concern = "dead") {
	image_blend = c_dkgrey;
};