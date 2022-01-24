if nether then
	minetest.log("Warning", "nether.DEPTH_CEILING = " .. nether.DEPTH_CEILING)
	minetest.log("Warning", "nether.DEPTH_FLOOR = " .. nether.DEPTH_FLOOR)
	if minetest.register_on_liquid_transformed then
		minetest.log("Warning", "nether_water_evap: registering liquid transform hook")
		minetest.register_on_liquid_transformed(function(pl, nl)
			for i,pos in pairs(pl) do
				if pos.y < -24995 then
					local n = minetest.get_node(pos).name
					if n == "default:water_flowing" or n == "default:river_water_flowing" then
						minetest.set_node(pos, nl[i])
						minetest.sound_play("default_cool_lava",
							{pos = pos, max_hear_distance = 16, gain = 0.25}, true)
					end
				end
			end
		end)
	else
		minetest.log("Warning", "nether_water_evap: liquid transform hook not present. Creating ABM instead")
		minetest.register_abm({
			label = "Nether Water Evaporate",
			nodenames = {"group:water", "default:water_flowing", "default:river_water_flowing"},
			min_y = -32000,
			max_y = -24995,
			interval = 1,
			chance = 1,
			catch_up = false,
			action = function(pos, node)
					minetest.set_node(pos, {name = "air"})
					minetest.sound_play("default_cool_lava",
						{pos = pos, max_hear_distance = 16, gain = 0.25}, true)
			end
		})
	end
end
