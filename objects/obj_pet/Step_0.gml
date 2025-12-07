/// @description Check stats, assign sprite, create healthbar, manage sounds

if (stat_concern != "dead") {
	switch (stat_concern) {
		case "satisfied":
			sprite_index = spr_alive;
			stat_concern = "alive";
		break;
		case "cleaned":
			stat_concern = "satisfied";
		break;
		case "fed":
			stat_concern = "satisfied";
		break;
		case "played":
			stat_concern = "satisfied";
		break;
		case "cleaning":
			if (audio_is_playing(aud_dirty)) {
				show_debug_message("stopping sound - aud_dirty");
				audio_stop_sound(aud_dirty);
			};
			sprite_index = spr_cleaning;
			if (!audio_is_playing(aud_clean)) {
				show_debug_message("playing sound - aud_clean");
				aud_clean = audio_play_sound(snd_bath_fill, 1, false);
			};
			stat_clean++
			if (stat_clean >= 99) {
				stat_concern = "cleaned";
			};
		break;
		case "feeding":
			if (audio_is_playing(aud_hungry)) {
				show_debug_message("stopping sound - aud_hungry");
				audio_stop_sound(aud_hungry);
			};
			sprite_index = spr_feeding;
			if (!audio_is_playing(aud_feeding)) {
				show_debug_message("playing sound - aud_feeding");
				aud_feeding = audio_play_sound(snd_drink_pour, 1, false);
			};
			stat_food++
			if (stat_food >= 99) {
				stat_concern = "fed";
			};
		break;
		case "playing":
			if (audio_is_playing(aud_bored)) {
				show_debug_message("stopping sound - aud_bored");
				audio_stop_sound(aud_bored);
			};
			if (!audio_is_playing(aud_playing)) {
				show_debug_message("playing sound - aud_playing");
				aud_playing = audio_play_sound(snd_swish, 1, false);
			};
			sprite_index = spr_playing;
			stat_play++
			if (stat_play >= 99) {
				stat_concern = "played";
			};
		break;
	};
	
	if (stat_clean <= 50 && stat_concern != "cleaning" && stat_concern != "dirty") {
		sprite_index = spr_dirty;
		if (aud_dirty == -1 || !audio_is_playing(aud_dirty)) {
				show_debug_message("playing sound - aud_dirty");
			aud_dirty = audio_play_sound(snd_flies, 1, true);
		};
		stat_concern = "dirty";
	};
	if (stat_food <= 50 && stat_concern != "feeding" && stat_concern != "hungry") {
		if (aud_hungry == -1 || !audio_is_playing(aud_hungry)) {
			aud_hungry = audio_play_sound(snd_hungry, 1, false);
		};
		sprite_index = spr_hungry;
		stat_concern = "hungry";
	};
	if (stat_play <= 50 && stat_concern != "playing" && stat_concern != "bored") {
		if (aud_bored == -1 || !audio_is_playing(aud_bored)) {
			aud_bored = audio_play_sound(snd_bored, 1, false);
		};
		sprite_index = spr_bored;
		stat_concern = "bored";
	};
	
	if (min(stat_clean, stat_food, stat_play) <= -1) {
		stat_concern = "dead";
	};
} else {
	stat_clean = 0;
	stat_food = 0;
	stat_play = 0;
	if (audio_is_playing(aud_bored)) {
		show_debug_message("stopping sound - aud_bored");
		audio_stop_sound(aud_bored);
	};
	if (audio_is_playing(aud_hungry)) {
		show_debug_message("stopping sound - aud_hungry");
		audio_stop_sound(aud_hungry);
	};
	if (audio_is_playing(aud_dirty)) {
		show_debug_message("stopping sound - aud_dirty");
		audio_stop_sound(aud_dirty);
	};
	if (audio_is_playing(aud_playing)) {
		show_debug_message("stopping sound - aud_playing");
		audio_stop_sound(aud_playing);
	};
	if (audio_is_playing(aud_feeding)) {
		show_debug_message("stopping sound - aud_feeding");
		audio_stop_sound(aud_feeding);
	};
	if (audio_is_playing(aud_clean)) {
		show_debug_message("stopping sound - aud_clean");
		audio_stop_sound(aud_clean);
	};
	if (!audio_is_playing(aud_dead)) {
		show_debug_message("playing sound - aud_dead");
		aud_dead = audio_play_sound(snd_church_bell, 1, false);
	};
	sprite_index = spr_dead;
};