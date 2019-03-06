
--table of common metric prefixes
metric_suffix = {
	--above 1  --name
	E = 10^18, --exa
	P = 10^15, --peta
	T = 10^12, --tera
	G = 10^9,  --giga
	M = 10^6,  --mega
	k = 10^3,  --kilo
	h = 10^2,  --hecto
	da = 10^1, --deca
	--below 1
	d = 10^-1, --deci
	c = 10^-2, --centi
	m = 10^-3  --mili
}
function string_to_num(str)
    num = ""
	for i = 1, #str do
		local a = str:sub(i,i)
		if tonumber(a) ~= nil then
			num = num .. a
		elseif tonumber(a) == nil and metric_suffix[a] ~= nil then
			suffix = a
		end
	end
	if suffix ~= nil then
		return tonumber(num) * metric_suffix[suffix]
	else
		return tonumber(num)
	end
end
--print(string_to_num("5G43j")) --debug crap

--Takes a list and recognises the existence of the elements in the list, 
--allowing it to be used in statements
function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end
