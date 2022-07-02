
#macro TAG_DEPTHSORT "depthsort"

asset_add_tags(obj_player, TAG_DEPTHSORT, asset_object)
asset_add_tags(obj_tree, TAG_DEPTHSORT, asset_object)

// constem os objetos marcados com a tag
depth_array = tag_get_asset_ids(TAG_DEPTHSORT, asset_object)

// contrem os ids e Y's das instancias
depth_grid = ds_grid_create(2, 0)

depthsort = function() {
	// conta as instancias com tag e aumenta a grid
	var _inst_count = 0;
	var _arr_len = array_length(depth_array)
	for (var i = 0; i < _arr_len; i++) {
		var _obj = depth_array[i]
		for (var j = 0; j < instance_number(_obj); j++) {
			_inst_count++;
		}
	}
	ds_grid_resize(depth_grid, 2, _inst_count)
	
	// popula a ds grid com as instancias marcadas e ordena
	var _grid_pos = 0
	for (var i = 0; i < _arr_len; i++) {
		for (var j = 0; j < instance_number(depth_array[i]); j++) {
			var _inst = instance_find(depth_array[i], j)
			depth_grid[# 0, _grid_pos] = _inst.id
			depth_grid[# 1, _grid_pos] = _inst.y
			_grid_pos++;
		}
	}
	ds_grid_sort(depth_grid, 1, true)
	
	// desenha as instancias da grid
	for (var i = 0; i < ds_grid_height(depth_grid); i++) {
		var _inst = depth_grid[# 0, i]
		with (_inst) {
			event_perform(ev_draw, 0);
		}
	}
}










