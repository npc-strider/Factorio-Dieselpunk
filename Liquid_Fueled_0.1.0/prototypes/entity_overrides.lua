
local entities = {
	{type="furnace", name="steel-furnace"},
	{type="assembling-machine", name="assembling-machine-1"},
	{type="assembling-machine", name="assembling-machine-2"},
}

for _, entities in pairs(entities) do
	local entity = util.table.deepcopy(data.raw[entities.type][entities.name])
	local smoke = entity.energy_source.smoke
	local item = util.table.deepcopy(data.raw["item"][entities.name])
	item.name = "liquid-" .. entity.name
	item.place_result = "liquid-" .. entity.name
	data:extend({item})
	entity.name = "liquid-" .. entity.name
	entity.minable.result = entity.name
	entity.energy_source = {
			type = "fluid",
			fuel_category = "basic-fuel",
			effectivity = 1,
			emissions = 0.02,
			fuel_inventory_size = 1,
			maximum_temperature = 40.0,
			scale_fluid_usage = true,
			smoke = smoke,
			fluid_box =
			{
				production_type = "input",
				pipe_picture = assembler3pipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 5,
				base_level = -1,
				filter = "fuel-gas",
				pipe_connections = {{ type="input", position = {-0.5, -math.abs(entity.selection_box[1][2])-0.5}}},
				secondary_draw_orders = { north = -1 }
			}
		}
	if entity.fluid_boxes == nil then
		entity.fluid_boxes = {}
	-- else
		-- entity.fluid_boxes.off_when_no_fluid_recipe = false
	end
	data:extend({entity})
end