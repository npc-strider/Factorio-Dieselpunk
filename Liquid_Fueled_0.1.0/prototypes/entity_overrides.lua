
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
				pipe_picture = assembler2pipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 5,
				base_level = -1,
				filter = "fuel-gas",
				pipe_connections = {{ type="input", position = {-0.5, -1.5}}}
			}
		}
	if entity.fluid_boxes == nil then
		entity.fluid_boxes = {}
	end
	entity.fluid_boxes[#entity.fluid_boxes+1] =
		{
			production_type = "output",
			-- pipe_covers = pipecoverspictures(), --TODO: ADD NULL PIPE COVER PICTURES
			base_area = 10^-5,
			base_level = 0,
			-- filter = "water", --TODO: ADD NULL FILTER WITH NULL IMAGE. try the filter = "none" first
			pipe_connections = {{ type="output", position = {0, entity.selection_box[2][2]}}}
		}
	entity.fluid_boxes.off_when_no_fluid_recipe = false
	data:extend({entity})
end