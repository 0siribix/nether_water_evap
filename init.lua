

if nether and nether.DEPTH_CEILING and nether.DEPTH_FLOOR then
	minetest.register_abm({
		label = "Nether Water Evaporate",
		nodenames = {"group:water", "default:water_flowing", "default:river_water_flowing"},
		min_y = -32000,
		max_y = 25000,
		interval = 1,
		chance = 1,
		catch_up = false,
		action = function(pos, node)
			if pos.y < nether.DEPTH_CEILING and pos.y > nether.DEPTH_FLOOR then
				minetest.set_node(pos, {name = "air"})
				minetest.sound_play("default_cool_lava",
					{pos = pos, max_hear_distance = 16, gain = 0.25}, true)
			end
		end
	})
end
