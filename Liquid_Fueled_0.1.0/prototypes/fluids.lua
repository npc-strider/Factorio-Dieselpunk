

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
		base_color = {r=0, g=0, b=0},
		flow_color = {r=0.5, g=0.5, b=0.5},
		max_temperature = 1000,
		icon = "__base__/graphics/icons/fluid/crude-oil.png",
		icon_size = 32,
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
		heat_capacity = "0.01MJ",
		fuel_value = "0.01MJ",
		fuel_category = "basic-fuel",
		order = "a[fluid]-b[crude-oil]"
	}
}
)