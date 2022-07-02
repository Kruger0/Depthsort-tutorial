
depth_array = tag_get_asset_ids(TAG_DEPTHSORT, asset_object)

// contrem os ids e Y's das instancias
depth_grid = ds_grid_create(2, 0)

for (var i = 0; i < array_length(depth_array); i++) {
	var _obj = depth_array[i]
	with (_obj) {
		visible = false;
	}
}


