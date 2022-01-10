--[[if nether then
	minetest.register_abm({
		label = "Nether Water Evaporate",
		nodenames = {"group:water", "default:water_flowing", "default:river_water_flowing"},
		min_y = -32000,
		max_y = -24995,
		interval = 1,
		chance = 1,
		catch_up = false,
		action = function(pos, node)
--			if pos.y < nether.DEPTH_CEILING and pos.y > nether.DEPTH_FLOOR then
				minetest.set_node(pos, {name = "air"})
				minetest.sound_play("default_cool_lava",
					{pos = pos, max_hear_distance = 16, gain = 0.25}, true)
			end
--		end
	})
end
]]--
if nether then
	if minetest.register_on_liquid_transformed then
		minetest.register_on_liquid_transformed(function(pl, nl)
			for i,pos in pairs(pl) do
				if pos.y < -24995 then
					n = minetest.get_node(pos).name
					if n = "default:water_flowing" or n = "default:river_water_flowing" then
						minetest.set_node(pos, nl[i])
						minetest.sound_play("default_cool_lava",
							{pos = pos, max_hear_distance = 16, gain = 0.25}, true)
					end
				end
			end
		end)
	else
		minetest.log("Warning", "Liquid transformed API not present. Creating ABM instead")
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

--[[
local water_flowing = minetest.registered_nodes["default:water_flowing"]
	minetest.log("Flowing water was found registered :)")
	if water_flowing then
		minetest.override_item("default:water_flowing", {
			on_construct = function(pos)
				minetest.log("Flowing water at y=" .. pos.y)
				if pos.y <= -24995 then
					minetest.set_node(pos, {name = "air"})
					minetest.sound_play("default_cool_lava",
						{pos = pos, max_hear_distance = 16, gain = 0.25}, true)
				end
			end,
			on_flood = function(pos)
				minetest.log("Flowing water flooding at y=" .. pos.y)
			end,
			on_timer = function(pos)
				minetest.log("Flowing water timer at y=" .. pos.y)
			end
		})
	end
end

]]--
