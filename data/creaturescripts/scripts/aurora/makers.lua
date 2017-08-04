local conditionSUP,conditionSPEED,conditionWARLOCK,conditionML,conditionMELEE,conditionDOUBLE,conditionSHIELDED,conditionAMP = {},{},{},{},{},{},{},{},{}
for i=1,300 do
  conditionSUP[i] = createConditionObject(CONDITION_ATTRIBUTES)
  setConditionParam(conditionSUP[i], CONDITION_PARAM_SUBID, 50)
  setConditionParam(conditionSUP[i], CONDITION_PARAM_TICKS, -1)
  setConditionParam(conditionSUP[i], CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 100+i)
  setConditionParam(conditionSUP[i], CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 100+i)
  
	conditionSPEED[i] = createConditionObject(CONDITION_SPEEDY)
	setConditionParam(conditionSPEED[i], CONDITION_PARAM_SUBID, 51)
	setConditionParam(conditionSPEED[i], CONDITION_PARAM_TICKS, -1)
	setConditionParam(conditionSPEED[i], CONDITION_PARAM_SPEED, 50+i)
  
  conditionWARLOCK[i] = createConditionObject(CONDITION_REGENERATION)
  setConditionParam(conditionWARLOCK[i], CONDITION_PARAM_SUBID, 52) 
  setConditionParam(conditionWARLOCK[i], CONDITION_PARAM_TICKS, -1)
  setConditionParam(conditionWARLOCK[i], CONDITION_PARAM_HEALTHGAIN, i)
  setConditionParam(conditionWARLOCK[i], CONDITION_PARAM_HEALTHTICKS, 2000)
  setConditionParam(conditionWARLOCK[i], CONDITION_PARAM_MANAGAIN, i)
  setConditionParam(conditionWARLOCK[i], CONDITION_PARAM_MANATICKS, 2000)

  conditionML[i] = createConditionObject(CONDITION_ATTRIBUTES)
  setConditionParam(conditionML[i], CONDITION_PARAM_SUBID, 53)
  setConditionParam(conditionML[i], CONDITION_PARAM_TICKS, -1)
  setConditionParam(conditionML[i], CONDITION_PARAM_STAT_MAGICPOINTS, i)
  setConditionParam(conditionML[i], CONDITION_PARAM_SKILL_SHIELD, i)

  conditionMELEE[i] = createConditionObject(CONDITION_ATTRIBUTES)
  setConditionParam(conditionMELEE[i], CONDITION_PARAM_SUBID, 54)
  setConditionParam(conditionMELEE[i], CONDITION_PARAM_TICKS, -1)
  setConditionParam(conditionMELEE[i], CONDITION_PARAM_SKILL_MELEE, i)
  setConditionParam(conditionMELEE[i], CONDITION_PARAM_SKILL_SHIELD, i)
  setConditionParam(conditionMELEE[i], CONDITION_PARAM_SKILL_DISTANCE, i) 

  conditionDOUBLE[i] = createConditionObject(CONDITION_ABSORBS_PHYSICAL)
  setConditionParam(conditionDOUBLE[i], CONDITION_PARAM_SUBID, 55)
  setConditionParam(conditionDOUBLE[i], CONDITION_PARAM_TICKS, -1)
  setConditionParam(conditionDOUBLE[i], CONDITION_PARAM_ABSORBPCTPHYSICAL, i)

  conditionSHIELDED[i] = createConditionObject(CONDITION_ABSORBS_MAGIC)
  setConditionParam(conditionSHIELDED[i], CONDITION_PARAM_SUBID, 56)
  setConditionParam(conditionSHIELDED[i], CONDITION_PARAM_TICKS, -1)
  setConditionParam(conditionSHIELDED[i], CONDITION_PARAM_ABSORBPCTMAGIC, i)
end

function getSlotType(n)
	if(not n)then
		return false
	end
	if(n:match('%[(.+)%]'))then
		n = n:match('%[(.+)%]')
		if(n == '?')then
			return 0,n
		else
			return n:match('(.-)%.([+-])(%d+)%%')
		end
	else
		return false
	end
end

local function loadSet(cid)
	local t = {}
	for slot=1,11 do
		t[slot] = ''
		local s = getPlayerSlotItem(cid,slot).uid
		if(s ~= 0)then
			t[slot] = Item(s):getAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
		end
	end
  return t
end

function chk(cid,f)
	if(not isPlayer(cid))then 
		return false 
	end
	local t = loadSet(cid)
	for i=1,#f do
		if(f[i] ~= t[i])then
			equip(cid,nil,slot)
			break
		end
	end
  addEvent(chk,2000,cid,t)
end

function check_slot(aab, i)
	if(i == 5 or i == 6)then
		if(isWeapon(aab) or isShield(aab) or isBow(aab))then
			return true
		end
	else
		return true
	end
	return false
end

function equip(cid,item,slot)
	local t = {}
	if(item)then
		local mm,sinal,qto = getSlotType(Item(item.uid):getAttribute(ITEM_ATTRIBUTE_DESCRIPTION))
		t[mm] = tonumber(qto)
	end
	for i=1,11 do
		if(i ~= slot)then
			if(getPlayerSlotItem(cid,i).itemid ~= 0)then
				local aab = getPlayerSlotItem(cid,i).uid
				if(aab and check_slot(aab,i))then
					for _ in Item(aab):getAttribute(ITEM_ATTRIBUTE_DESCRIPTION):gmatch('(%[.-%])') do
						local mm,sinal,qto2 = getSlotType(_)
						if(mm)then
							if(not t[mm])then
								t[mm] = 0
							end
							t[mm] = t[mm]+tonumber(qto2)
							t[mm] = t[mm] > 300 and 300 or t[mm]
						end
					end
				end
			end
		end
	end
	local fu = 0
	local ca = {}
	local s = ''
	for sl,n in pairs(t) do
		fu = fu+1
		s = s..''..n..'% more of '..sl..'\n'
	if(sl == 'supreme')then
	  doAddCondition(cid,conditionSUP[tonumber(n)])
	  ca[50] = 1
    elseif(sl == 'speedy')then
      doAddCondition(cid,conditionSPEED[tonumber(n)])
      ca[51] = 1
    elseif(sl == 'warlock')then
      doAddCondition(cid,conditionWARLOCK[tonumber(n)])
      ca[52] = 1
    elseif sl == 'magically' then
	 if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 5 or getPlayerVocation(cid) == 6 or getPlayerVocation(cid) == 9  or getPlayerVocation(cid) == 10 then
      doAddCondition(cid,conditionML[tonumber(n)])
      ca[53] = 1
	  end
    elseif sl == 'blessed' then
	 if getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 7 or getPlayerVocation(cid) == 8 or getPlayerVocation(cid) == 11 or getPlayerVocation(cid) == 12 then
      doAddCondition(cid,conditionMELEE[tonumber(n)])
      ca[54] = 1
	  end
    elseif sl == 'double' then
	 if getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 7 or getPlayerVocation(cid) == 8 or getPlayerVocation(cid) == 11  or getPlayerVocation(cid) == 12 then
      doAddCondition(cid,conditionDOUBLE[tonumber(n)])
      ca[55] = 1
	  end
    elseif sl == 'shielded' then
	 if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 5 or getPlayerVocation(cid) == 6 or getPlayerVocation(cid) == 9 or getPlayerVocation(cid) == 10 then
      doAddCondition(cid,conditionSHIELDED[tonumber(n)])
      ca[56] = 1
	       end
		end
	end
	if(fu > 0)then
		for i=50,56 do
			if not ca[i] then
				doRemoveCondition(cid,conditionML,i)
				doRemoveCondition(cid,conditionSUP,i)
				doRemoveCondition(cid,conditionWARLOCK,i)
				doRemoveCondition(cid,conditionMELEE,i)
				doRemoveCondition(cid,conditionDOUBLE,i)
				doRemoveCondition(cid,conditionSHIELDED,i)
			end
		end
	end
	return true
end

function onLogin(creature)
	local cid = creature:getId()
	equip(cid,nil,slot)
	addEvent(chk,2000,cid,loadSet(cid))
	return true
end