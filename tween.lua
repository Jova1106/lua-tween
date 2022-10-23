-- EASING FUNCTIONS --
local math_pi = math.pi
local math_pow = math.pow
local math_sqrt = math.sqrt
local math_sin = math.sin
local math_cos = math.cos

local function TWEEN_EASE_LINEAR(n) -- easeLinear
	return n
end

local function TWEEN_EASE_IN_OUT(n) -- easeInOut
	return n * n * (3 - 2 * n)
end

-- Credit: https://easings.net/
local function TWEEN_EASE_SINE_IN(n) -- easeInSine
	return 1 - math_cos(n * math_pi / 2)
end

local function TWEEN_EASE_SINE_OUT(n) -- easeOutSine
	return math_sin(n * math_pi / 2)
end

local function TWEEN_EASE_SINE_IN_OUT(n) -- easeInOutSine
	return -(math_cos(math_pi * n) - 1) / 2
end

local function TWEEN_EASE_QUAD_IN(n) -- easeInQuad
	return n * n
end

local function TWEEN_EASE_QUAD_OUT(n) -- easeOutQuad
	return 1 - (1 - n) * (1 - n)
end

local function TWEEN_EASE_QUAD_IN_OUT(n) -- easeInOutQuad
	return n < 0.5 and 2 * n * n or 1 - math_pow(-2 * n + 2, 2) / 2
end

local function TWEEN_EASE_CUBIC_IN(n) -- easeInCubic
	return n * n * n
end

local function TWEEN_EASE_CUBIC_OUT(n) -- easeOutCubic
	return 1 - math_pow(1 - n, 3)
end

local function TWEEN_EASE_CUBIC_IN_OUT(n) -- easeInOutCubic
	return n < 0.5 and 4 * n * n * n or 1 - math_pow(-2 * n + 2, 3) / 2
end

local function TWEEN_EASE_QUART_IN(n) -- easeInQuart
	return n * n * n * n
end

local function TWEEN_EASE_QUART_OUT(n) -- easeOutQuart
	return 1 - math_pow(1 - n, 4)
end

local function TWEEN_EASE_QUART_IN_OUT(n) -- easeInOutQuart
	return n < 0.5 and 8 * n * n * n * n or 1 - math_pow(-2 * n + 2, 4) / 2
end

local function TWEEN_EASE_QUINT_IN(n) -- easeInQuint
	return n * n * n * n * n
end

local function TWEEN_EASE_QUINT_OUT(n) -- easeOutQuint
	return 1 - math_pow(1 - n, 5)
end

local function TWEEN_EASE_QUINT_IN_OUT(n) -- easeInOutQuint
	return n < 0.5 and 16 * n * n * n * n * n or 1 - math_pow(-2 * n + 2, 5) / 2
end

local function TWEEN_EASE_EXPO_IN(n) -- easeInExpo
	return n == 0 and 0 or math_pow(2, 10 * n - 10)
end

local function TWEEN_EASE_EXPO_OUT(n) -- easeOutExpo
	return n == 1 and 1 or 1 - math_pow(2, -10 * n)
end

local function TWEEN_EASE_EXPO_IN_OUT(n) -- easeInOutExpo
	return n == 0 and 0 or n == 1 and 1 or n < 0.5 and math_pow(2, 20 * n - 10) / 2 or (2 - math_pow(2, -20 * n + 10)) / 2
end

local function TWEEN_EASE_CIRC_IN(n) -- easeInCirc
	return 1 - math_sqrt(1 - math_pow(n, 2))
end

local function TWEEN_EASE_CIRC_OUT(n) -- easeOutCirc
	return math_sqrt(1 - math_pow(n - 1, 2))
end

local function TWEEN_EASE_CIRC_IN_OUT(n) -- easeInOutCirc
	return n < 0.5 and (1 - math_sqrt(1 - math_pow(2 * n, 2))) / 2 or (math_sqrt(1 - math_pow(-2 * n + 2, 2)) + 1) / 2
end

local function TWEEN_EASE_BACK_IN(n) -- easeInBack
	local c1 = 1.70158
	local c3 = c1 + 1

	return c3 * n * n * n - c1 * n * n
end

local function TWEEN_EASE_BACK_OUT(n) -- easeOutBack
	local c1 = 1.70158
	local c3 = c1 + 1

	return 1 + c3 * math_pow(n - 1, 3) + c1 * math_pow(n - 1, 2)
end

local function TWEEN_EASE_BACK_IN_OUT(n) -- easeInOutBack
	local c1 = 1.70158
	local c2 = c1 * 1.525

	return n < 0.5 and (math_pow(2 * n, 2) * ((c2 + 1) * 2 * n - c2)) / 2 or (math_pow(2 * n - 2, 2) * ((c2 + 1) * (n * 2 - 2) + c2) + 2) / 2
end

local function TWEEN_EASE_ELASTIC_IN(n) -- easeInElastic
	local c4 = (2 * math_pi) / 3

	return n == 0 and 0 or n == 1 and 1 or -math_pow(2, 10 * n - 10) * math_sin((n * 10 - 10.75) * c4)
end

local function TWEEN_EASE_ELASTIC_OUT(n) -- easeOutElastic
	local c4 = (2 * math_pi) / 3

	return n == 0 and 0 or n == 1 and 1 or math_pow(2, -10 * n) * math_sin((n * 10 - 0.75) * c4) + 1
end

local function TWEEN_EASE_ELASTIC_IN_OUT(n) -- easeInOutElastic
	local c5 = (2 * math_pi) / 4.5

	return n == 0 and 0 or n == 1 and 1 or n < 0.5 and -(math_pow(2, 20 * n - 10) * math_sin((20 * n - 11.125) * c5)) / 2 or (math_pow(2, -20 * n + 10) * math_sin((20 * n - 11.125) * c5)) / 2 + 1
end

local function TWEEN_EASE_BOUNCE_IN(n) -- easeInBounce
	return 1 - TWEEN_EASE_BOUNCE_OUT(1 - n)
end

local function TWEEN_EASE_BOUNCE_OUT(n) -- easeOutBounce
	local n1 = 7.5625
	local d1 = 2.75

	if n < 1 / d1 then
		return n1 * n * n
	elseif n < 2 / d1 then
		return n1 * (n - 1.5 / d1) * (n - 1.5 / d1) + 0.75
	elseif n < 2.5 / d1 then
		return n1 * (n - 2.25 / d1) * (n - 2.25 / d1) + 0.9375
	else
		return n1 * (n - 2.625 / d1) * (n - 2.625 / d1) + 0.984375
	end
end

local function TWEEN_EASE_BOUNCE_IN_OUT(n) -- easeInOutBounce
	return n < 0.5 and (1 - TWEEN_EASE_BOUNCE_OUT(1 - 2 * n)) / 2 or (1 + TWEEN_EASE_BOUNCE_OUT(2 * n - 1)) / 2
end
--------------------------------------------------------------------------------

-- Basic Vector2 Object
local metaTable_Vector2 = {
	MetaName = "Vector2"
}

metaTable_Vector2.__index = metaTable_Vector2

local function isvector2(v)
	return getmetatable(v) == metaTable_Vector2
end

local _type = type
local function type(v)
	if isvector2(v) then
		return metaTable_Vector2.MetaName
	end
	
	return _type(v)
end

function Vector2(x, y)
	local Vector2 = {
		x = x,
		y = y
	}
	
	return setmetatable(Vector2, metaTable_Vector2)
end

-- Lerp Functions
local function Lerp(from, to, t)
	return from + (to - from) * t
end

local function LerpVector2(from, to, t)
	return Vector2(
		Lerp(from.x, to.x, t),
		Lerp(from.y, to.y, t)
	)
end

local function LerpVector(from, to, t)
	return Vector(
		Lerp(from.x, to.x, t),
		Lerp(from.y, to.y, t),
		Lerp(from.z, to.z, t)
	)
end

-- Tween Object
local all_tweens = {}

local type_to_function = {
	["number"] = Lerp,
	["vector2"] = LerpVector2,
	["vector"] = LerpVector
}

local metaTable_Tween = {
	__newindex = function(self, key, value)
		rawset(self, key, value)
	end,
	
	Start = function(self)
		self.start_time = SysTime()
		self.end_time = self.start_time + self.duration
		self.running = true

		self.lerp_type = type_to_function[type(self.from):lower()]
		
		all_tweens[self] = true
	end,
	
	Update = function(self)
		if self.running then
			local time = SysTime()
			
			if time >= self.end_time then
				self.running = false
				self.value = self.to
				
				all_tweens[self] = nil

				if self.callback != nil then
					self.callback()
				end
				
				return
			end
			
			local alpha = (time - self.start_time) / self.duration
			
			self.value = self.lerp_type(self.from, self.to, self.ease_type(alpha))
		end
	end,
	
	GetValue = function(self)
		return self.value
	end
}

metaTable_Tween.__index = metaTable_Tween

function Tween( from, to, duration, ease_type, callback )
	local Tween = {
		from = from,
		to = to,
		duration = duration,
		ease_type = ease_type,
		callback = callback,
		value = from
	}
	
	return setmetatable(Tween, metaTable_Tween)
end

-- Tween Handler
hook.Add( "Think", "process_tweens", function()
	if table.IsEmpty(all_tweens) then return end

	for tween in next, all_tweens do
		tween:Update()
	end
end )
