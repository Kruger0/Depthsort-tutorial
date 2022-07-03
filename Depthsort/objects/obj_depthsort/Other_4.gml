
//0 = id das intancias
//1 = posicao das intancias

depth_grid = ds_grid_create(2, 0)
depth_array = tag_get_asset_ids(TAG_DEPTHSORT, asset_object)

for (var i = 0; i < array_length(depth_array); i++) {
	var _obj = depth_array[i]
	// seta para os q ja existe
	with (_obj) {visible = false}
	// seta para os que forem criados
	object_set_visible(_obj, false)
}

