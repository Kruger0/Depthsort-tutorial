function draw_shadow(){
	var _spr_w = sprite_width
	var _my_w = sprite_get_width(spr_shadow)
	var _my_h = sprite_get_height(spr_shadow)
	draw_sprite_stretched(spr_shadow, 0, x-_spr_w/2, y-_my_h/2, _spr_w, _my_h)
}