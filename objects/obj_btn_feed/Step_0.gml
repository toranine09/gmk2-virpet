/// @description on click start feeding

var plate = obj_pet.stat_food;

if (plate < 99) {
	if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, obj_btn_feed)) {
		image_blend = c_grey;
		obj_pet.stat_concern = "feeding";
	};
	image_blend = c_white;
} else if (plate >= 99) {
	image_blend = c_dkgrey;
};

if (obj_pet.stat_concern = "dead") {
	image_blend = c_dkgrey;
};