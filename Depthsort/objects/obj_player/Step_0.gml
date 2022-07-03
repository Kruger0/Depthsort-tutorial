var hspd = keyboard_check(ord("D")) - keyboard_check(ord("A"))
var vspd = keyboard_check(ord("S")) - keyboard_check(ord("W"))

hor_spd = lerp(hor_spd, spd*hspd, 0.2)
ver_spd = lerp(ver_spd, spd*vspd, 0.2)

x += hor_spd
y += ver_spd

if (keyboard_check_pressed(ord("P"))) {
	room_goto_next()
}
if (keyboard_check_pressed(ord("O"))) {
	room_goto_previous()
}

if mouse_check_button_pressed(mb_left) {
	instance_create_layer(mouse_x, mouse_y, layer, obj_tree, {
		image_xscale : 0.6,
		image_yscale : 0.6,
	})
}











