data:extend(
{
	{
		type = "fuel-category",
		name = "basic-fuel"
	},
	{
		type = "fluid",
		name = "fuel-gas",
		default_temperature = 24,
	    base_color = {r=0.57, g=0.33, b=0},
		flow_color = {r=1, g=0.73, b=0.07},
		max_temperature = 100,
		icon = "__base__/graphics/icons/fluid/light-oil.png",	
		icon_size = 32,
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
		heat_capacity = "0.01MJ",
		fuel_value = "0.01MJ",
		fuel_category = "basic-fuel",
		order = "a[fluid]-b[crude-oil]"
	},
	{
		type = "recipe",
		name = "rotate",
		category = "crafting-with-fluid",
		energy_required = 1,
		ingredients =
		{
		  {type="fluid", name="null", amount=10^-10}
		},
		results=
		{
		  {type="fluid", name="null", amount=10^-10}
		}
	}
})
local null = util.table.deepcopy(data.raw["fluid"]["water"])
null.name = "null"
null.icon = "__Liquid_Fueled__/graphics/empty.png"
null.icon_size = 32
null.order = "a[fluid]-a[null]"
data:extend({null})