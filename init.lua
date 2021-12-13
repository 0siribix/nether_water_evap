minetest.register_abm({
	label = "Nether Water Evaporate",
	nodenames = {"group:water", "default:water_flowing", "default:river_water_flowing"},
	min_y = nether.DEPTH_FLOOR,
	max_y = nether.DEPTH_CEILING,
	interval = 1,
	chance = 1,
	catch_up = false,
	action = function(pos, node)
		minetest.set_node(pos, {name = "air"})
		minetest.sound_play("default_cool_lava",
			{pos = pos, max_hear_distance = 16, gain = 0.25}, true)
	end})
end
