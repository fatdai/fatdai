
-- for i,v in ipairs(test) do
-- 	if i % 2 == 0 then
-- 		table.remove(test,i)
-- 	end
-- end


-- for i = table.getn(test),1,-1 do
-- 	if i % 2 == 0 then
-- 		table.remove(test,i)
-- 	end
-- end


-- 删除list中的所有和item相等的
function removeItem( list,item,removeAll )
	local rmCount = 0
	for i = 1,table.getn(list) do
		if list[i - rmCount] == item then
			table.remove(list, i - rmCount)
			if removeAll then
				rmCount = rmCount + 1
			else
				break
			end
		end
	end
end

-- removeItem(test,2,true)

-- 对要删除的做标记
local test = { 3,8,1,2,2,4,2,6,7,2,9,2}
local temp = {}
for i,v in ipairs(test) do
	if v == 2 then
		table.insert(temp,i)
	end
end


table.sort(temp,function ( d,e )
	return d > e
end)

for k,v in ipairs(temp) do
	table.remove(test,v)
end

for i,v in ipairs(test) do
	print(i,v)
end