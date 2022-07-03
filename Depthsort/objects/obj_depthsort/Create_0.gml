#macro TAG_DEPTHSORT "depthsort"

asset_add_tags(obj_player, TAG_DEPTHSORT, asset_object)
asset_add_tags(obj_tree, TAG_DEPTHSORT, asset_object)

depth_grid = ds_grid_create(2, 0)
depth_array = tag_get_asset_ids(TAG_DEPTHSORT, asset_object)

for (var i = 0; i < array_length(depth_array); i++) {
	var _obj = depth_array[i]
	// seta para os q ja existe
	with (_obj) {visible = false}
	// seta para os que forem criados
	object_set_visible(_obj, false)
}

depthsort = function() {
	// aumenta a ds grid
	var _len = array_length(depth_array)
	var _inst_count = 0
	for (var i = 0; i < _len; i++) {
		_inst_count += instance_number(depth_array[i]);
	}
	ds_grid_resize(depth_grid, 2, _inst_count)
	
	// pega as instancias com a tag e salva elas na grid, depois ordena a grid
	var _grid_pos = 0;
	for (var i = 0; i < _len; i++) {
		for (var j = 0; j < instance_number(depth_array[i]); j++) {
			var _inst = instance_find(depth_array[i], j)
			depth_grid[# 0, _grid_pos] = _inst.id
			depth_grid[# 1, _grid_pos] = _inst.y
			_grid_pos++;
		}
	}
	ds_grid_sort(depth_grid, 1, true)
	
	// desenha as instancias da grid ordenadamente
	for (var i = 0; i < ds_grid_height(depth_grid); i++) {
		var _inst = depth_grid[# 0, i]
		with (_inst) {
			event_perform(ev_draw, 0);
		}
	}
}



















































