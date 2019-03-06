require("functions")

fuel_blacklist = Set {
	"fuel-gas",
	"nuclear-fuel",
	"rocket-fuel",
	"solid-fuel"
}

--hidden category
data:extend(
{{
	type = "recipe-category",
	name = "gasification-recipes"
}})

for _, item in pairs(data.raw.item) do
    if item.fuel_value ~= nil and item.fuel_category == "chemical" and fuel_blacklist[item.name] == nil then
		local fuel_value = string_to_num(item.fuel_value)
		local output_amount = math.ceil(fuel_value/10000)
		local water_amount = math.ceil(fuel_value/100000)
		--local energy = (output_amount^1.5)/(output_amount^1.1)
		local energy = 0.25
		--[[
		Coal example:
		4MJ = 4,000,000J
		4,000,000/10,000 = 400 fuel-gas
		400*0.01MJ = 4MJ
		Fuel-Gas == Coal
		]]
		local recipe = {
			type = "recipe",
			name = "gasification-of-" .. item.name, 
			category = "gasification-recipes",
			energy_required = energy,
			enabled = true, --change this to false on release
			ingredients =
			{
				{type="fluid", name="water", amount=water_amount},
				{type="item", name=item.name, amount=1}
			},
			results=
			{
				{type="fluid", name="fuel-gas", amount=output_amount, temperature = 25}
			},
			crafting_machine_tint =
			{
				primary = {r = 0.498, g = 0.498, b = 0.498, a = 0.000}, -- #7f7f7f00
				secondary = {r = 0.400, g = 0.400, b = 0.400, a = 0.000}, -- #66666600
				tertiary = {r = 0.305, g = 0.305, b = 0.305, a = 0.000}, -- #4d4d4d00
			}
		}
		data:extend({recipe})
	end
end