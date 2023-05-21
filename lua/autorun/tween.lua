-- MIT License

-- Copyright (c) 2022 Jova1106

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

--------------------------------------------------------------------------------

-- EASING FUNCTIONS
local math_pi = math.pi
local math_pow = math.pow
local math_sqrt = math.sqrt
local math_sin = math.sin
local math_cos = math.cos

function TWEEN_EASE_LINEAR(n)
	return n
end

function TWEEN_EASE_IN_OUT(n)
	return n * n * (3 - 2 * n)
end

-- Credit: https://easings.net/
function TWEEN_EASE_SINE_IN(n)
	return 1 - math_cos(n * math_pi / 2)
end

function TWEEN_EASE_SINE_OUT(n)
	return math_sin(n * math_pi / 2)
end

function TWEEN_EASE_SINE_IN_OUT(n)
	return -(math_cos(math_pi * n) - 1) / 2
end

function TWEEN_EASE_QUAD_IN(n)
	return n * n
end

function TWEEN_EASE_QUAD_OUT(n)
	return 1 - (1 - n) * (1 - n)
end

function TWEEN_EASE_QUAD_IN_OUT(n)
	return n < 0.5 and 2 * n * n or 1 - math_pow(-2 * n + 2, 2) / 2
end

function TWEEN_EASE_CUBIC_IN(n)
	return n * n * n
end

function TWEEN_EASE_CUBIC_OUT(n)
	return 1 - math_pow(1 - n, 3)
end

function TWEEN_EASE_CUBIC_IN_OUT(n)
	return n < 0.5 and 4 * n * n * n or 1 - math_pow(-2 * n + 2, 3) / 2
end

function TWEEN_EASE_QUART_IN(n)
	return n * n * n * n
end

function TWEEN_EASE_QUART_OUT(n)
	return 1 - math_pow(1 - n, 4)
end

function TWEEN_EASE_QUART_IN_OUT(n)
	return n < 0.5 and 8 * n * n * n * n or 1 - math_pow(-2 * n + 2, 4) / 2
end

function TWEEN_EASE_QUINT_IN(n)
	return n * n * n * n * n
end

function TWEEN_EASE_QUINT_OUT(n)
	return 1 - math_pow(1 - n, 5)
end

function TWEEN_EASE_QUINT_IN_OUT(n)
	return n < 0.5 and 16 * n * n * n * n * n or 1 - math_pow(-2 * n + 2, 5) / 2
end

function TWEEN_EASE_EXPO_IN(n)
	return n == 0 and 0 or math_pow(2, 10 * n - 10)
end

function TWEEN_EASE_EXPO_OUT(n)
	return n == 1 and 1 or 1 - math_pow(2, -10 * n)
end

function TWEEN_EASE_EXPO_IN_OUT(n)
	return n == 0 and 0 or n == 1 and 1 or n < 0.5 and math_pow(2, 20 * n - 10) / 2 or (2 - math_pow(2, -20 * n + 10)) / 2
end

function TWEEN_EASE_CIRC_IN(n)
	return 1 - math_sqrt(1 - math_pow(n, 2))
end

function TWEEN_EASE_CIRC_OUT(n)
	return math_sqrt(1 - math_pow(n - 1, 2))
end

function TWEEN_EASE_CIRC_IN_OUT(n)
	return n < 0.5 and (1 - math_sqrt(1 - math_pow(2 * n, 2))) / 2 or (math_sqrt(1 - math_pow(-2 * n + 2, 2)) + 1) / 2
end

function TWEEN_EASE_BACK_IN(n)
	local c1 = 1.70158
	local c3 = c1 + 1

	return c3 * n * n * n - c1 * n * n
end

function TWEEN_EASE_BACK_OUT(n)
	local c1 = 1.70158
	local c3 = c1 + 1

	return 1 + c3 * math_pow(n - 1, 3) + c1 * math_pow(n - 1, 2)
end

function TWEEN_EASE_BACK_IN_OUT(n)
	local c1 = 1.70158
	local c2 = c1 * 1.525

	return n < 0.5 and (math_pow(2 * n, 2) * ((c2 + 1) * 2 * n - c2)) / 2 or (math_pow(2 * n - 2, 2) * ((c2 + 1) * (n * 2 - 2) + c2) + 2) / 2
end

function TWEEN_EASE_ELASTIC_IN(n)
	local c4 = (2 * math_pi) / 3

	return n == 0 and 0 or n == 1 and 1 or -math_pow(2, 10 * n - 10) * math_sin((n * 10 - 10.75) * c4)
end

function TWEEN_EASE_ELASTIC_OUT(n)
	local c4 = (2 * math_pi) / 3

	return n == 0 and 0 or n == 1 and 1 or math_pow(2, -10 * n) * math_sin((n * 10 - 0.75) * c4) + 1
end

function TWEEN_EASE_ELASTIC_IN_OUT(n)
	local c5 = (2 * math_pi) / 4.5

	return n == 0 and 0 or n == 1 and 1 or n < 0.5 and -(math_pow(2, 20 * n - 10) * math_sin((20 * n - 11.125) * c5)) / 2 or (math_pow(2, -20 * n + 10) * math_sin((20 * n - 11.125) * c5)) / 2 + 1
end

function TWEEN_EASE_BOUNCE_IN(n)
	return 1 - TWEEN_EASE_BOUNCE_OUT(1 - n)
end

function TWEEN_EASE_BOUNCE_OUT(n)
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

function TWEEN_EASE_BOUNCE_IN_OUT(n)
	return n < 0.5 and (1 - TWEEN_EASE_BOUNCE_OUT(1 - 2 * n)) / 2 or (1 + TWEEN_EASE_BOUNCE_OUT(2 * n - 1)) / 2
end
--------------------------------------------------------------------------------

-- table.Inherit without the self.BaseClass table
local function table_Inherit(target, base)
	for k, v in next, base do
		if target[k] then continue end
		
		target[k] = v
	end
	
	return target
end

-- Basic Vector2 Object
local metaTable_Vector2 = {
	SetUnpacked = function(self, x, y)
		self.x = x
		self.y = y
	end
}

metaTable_Vector2.__index = metaTable_Vector2

local function isvector2(v)
	return getmetatable(v) == metaTable_Vector2
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

local function Lerp2(_, from, to, t)
	return from + (to - from) * t
end

local function LerpVector2(from, to, t)
	return Vector2(
		Lerp(from.x, to.x, t),
		Lerp(from.y, to.y, t)
	)
end

local function LerpVector2Unpacked(vector2, from, to, t)
	vector2:SetUnpacked(
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

local function LerpAng(from, to, t)
	local d = to - from

	if d > 180 then
		to = to - 360
	elseif d < -180 then
		to = to + 360
	end

	return Lerp(from, to, t)
end

local function LerpAngle(from, to, t)
	return Angle(
		LerpAng(from.p, to.p, t),
		LerpAng(from.y, to.y, t),
		LerpAng(from.r, to.r, t)
	)
end

local function QuadraticBezier(p1, c1, p2, t)
	local x1 = Lerp(p1.x, c1.x, t)
	local y1 = Lerp(p1.y, c1.y, t)
	local x2 = Lerp(c1.x, p2.x, t)
	local y2 = Lerp(c1.y, p2.y, t)
	local z1 = Lerp(p1.z, c1.z, t)
	local z2 = Lerp(c1.z, p2.z, t)
	local x = Lerp(x1, x2, t)
	local y = Lerp(y1, y2, t)
	local z = Lerp(z1, z2, t)
	
	return Vector(x, y, z)
end

local function CubicBezier(p1, c1, c2, p2, t)	
	local v1 = QuadraticBezier(p1, c1, c2, t)
	local v2 = QuadraticBezier(c1, c2, p2, t)
	local x = Lerp(v1.x, v2.x, t)
	local y = Lerp(v1.y, v2.y, t)
	local z = Lerp(v1.z, v2.z, t)
	
	return Vector(x, y, z)
end

local function LerpVectorUnpacked(vector, from, to, t)
	vector:SetUnpacked(
		Lerp(from.x, to.x, t),
		Lerp(from.y, to.y, t),
		Lerp(from.z, to.z, t)
	)
end

local function LerpColor(from, to, t)
	return Color(
		Lerp(from.r, to.r, t),
		Lerp(from.g, to.g, t),
		Lerp(from.b, to.b, t),
		Lerp(from.a, to.a, t)
	)
end

local function LerpColorUnpacked(color, from, to, t)
	color:SetUnpacked(
		Lerp(from.r, to.r, t),
		Lerp(from.g, to.g, t),
		Lerp(from.b, to.b, t),
		Lerp(from.a, to.a, t)
	)
end

local function LerpAngleUnpacked(angle, from, to, t)
	angle:SetUnpacked(
		LerpAng(from.p, to.p, t),
		LerpAng(from.y, to.y, t),
		LerpAng(from.r, to.r, t)
	)
end

-- Tween Object(s)
local all_tweens = {}
local running_tweens = {}
local paused_tweens = {}
local stopped_tweens = {}

local type_to_function = {
	["number"] = Lerp,
	["vector2"] = LerpVector2,
	["vector"] = LerpVector,
	["color"] = LerpColor,
	["angle"] = LerpAngle
}

local type_to_function_unpacked = {
	["number"] = Lerp2,
	["vector2"] = LerpVector2Unpacked,
	["vector"] = LerpVectorUnpacked,
	["color"] = LerpColorUnpacked,
	["angle"] = LerpAngleUnpacked
}

local function tween_type(object)
	return isvector2(object) and "vector2"
		or IsColor(object) and "color"
		or type(object):lower()
end

local metaTable_Tween = {
	__newindex = function(self, key, value)
		rawset(self, key, value)
	end,
	
	Start = function(self)
		self.running = true
		self.start_time = SysTime()
		self.end_time = self.start_time + self.duration
		self.time_left = self.duration
		self.lerp_type = type_to_function[tween_type(self.from)]
		
		all_tweens[self] = true
		running_tweens[self] = true
	end,
	
	SetPermanent = function(self, bool)
		self.permanent = bool
	end,
	
	SetFrom = function(self, from)
		self.from = from
	end,
	
	SetTo = function(self, to)
		self.to = to
	end,
	
	SetWaypoints = function(self, from, to)
		self.from = from
		self.to = to
	end,
	
	SetDuration = function(self, duration)
		self.duration = duration
	end,
	
	SetEaseType = function(self, ease_type)
		self.ease_type = ease_type
	end,
	
	Restart = function(self)
		if !all_tweens[self] then
			self:Start()
			
			return
		end
		
		self.running = true
		self.start_time = SysTime()
		self.end_time = self.start_time + self.duration
		self.time_left = self.duration
		
		if !running_tweens[self] then
			running_tweens[self] = true
		end
		
		if paused_tweens[self] then
			paused_tweens[self] = nil
		elseif stopped_tweens[self] then
			stopped_tweens[self] = nil
		end
	end,
	
	Pause = function(self)
		if stopped_tweens[self] then return end
		
		self.running = false
		
		if running_tweens[self] then
			running_tweens[self] = nil
			paused_tweens[self] = true
		end
	end,
	
	Resume = function(self)
		if stopped_tweens[self] then
			self:Restart()
			
			return
		end
		
		self.start_time = SysTime() - (self.duration - self.time_left)
		self.end_time = self.start_time + self.duration
		self.running = true
		
		if paused_tweens[self] then
			paused_tweens[self] = nil
			running_tweens[self] = true
		end
	end,
	
	Stop = function(self)
		self.running = false
		
		if running_tweens[self] then
			running_tweens[self] = nil
		elseif paused_tweens[self] then
			paused_tweens[self] = nil
		end
		
		stopped_tweens[self] = true
	end,
	
	Update = function(self)
		if self.running then
			local time = SysTime()
			self.time_left = self.end_time - time
			
			if time >= self.end_time then
				self.running = false
				self.value = self.to
				
				if !self.permanent then
					all_tweens[self] = nil
					running_tweens[self] = nil
				end
				
				if self.callback != nil then
					self.callback(self)
				end
				
				return
			end
			
			local alpha = (time - self.start_time) / self.duration
			
			if self.bezier_type == "quadratic" then
				self.value = QuadraticBezier(self.from, self.c1, self.to, self.ease_type(alpha))
			elseif self.bezier_type == "cubic" then
				self.value = CubicBezier(self.from, self.c1, self.c2, self.to, self.ease_type(alpha))
			else
				self.value = self.lerp_type(self.from, self.to, self.ease_type(alpha))
			end
		end
	end,
	
	TimeLeft = function(self)
		return self.time_left
	end,
	
	GetValue = function(self)
		return self.value
	end,
	
	Destroy = function(self)
		all_tweens[self] = nil

		if running_tweens[self] then
			running_tweens[self] = nil
		elseif paused_tweens[self] then
			paused_tweens[self] = nil
		elseif stopped_tweens[self] then
			stopped_tweens[self] = nil
		end
	end,
	
	SetCallback = function(self, callback)
		self.callback = callback
	end,

	SetBezierType = function(self, bezier_type, control_point, control_point_2)
		self.bezier_type = bezier_type
		self.c1 = control_point

		if bezier_type == "cubic" then
			self.c2 = control_point_2
		end
	end
}

metaTable_Tween.__index = metaTable_Tween

function Tween(from, to, duration, ease_type, callback)
	local Tween = {
		from = from,
		to = to,
		duration = duration,
		ease_type = ease_type,
		callback = callback,
		value = from,
		time_left = duration,
		permanent = false,
		running = false
	}
	
	return setmetatable(Tween, metaTable_Tween)
end

local metaTable_TweenUnpacked = {
	Start = function(self)
		self.running = true
		self.start_time = SysTime()
		self.end_time = self.start_time + self.duration
		self.time_left = self.duration
		self.lerp_type_unpacked = type_to_function_unpacked[tween_type(self.base_object)]
		
		all_tweens[self] = true
		running_tweens[self] = true
	end,
	
	Update = function(self)
		if self.running then
			local time = SysTime()
			self.time_left = self.end_time - time
			
			if time >= self.end_time then
				self.running = false
				self.value = self.to
				
				if !self.permanent then
					all_tweens[self] = nil
					running_tweens[self] = nil
				end
				
				if self.callback != nil then
					self.callback()
				end
				
				return
			end
			
			local alpha = (time - self.start_time) / self.duration
			
			self.value = self.lerp_type_unpacked(self.base_object, self.from, self.to, self.ease_type(alpha))
		end
	end
}

table_Inherit(metaTable_TweenUnpacked, metaTable_Tween)

metaTable_TweenUnpacked.__index = metaTable_TweenUnpacked

function TweenUnpacked(base_object, from, to, duration, ease_type, callback)
	local Tween = {
		base_object = base_object,
		from = from,
		to = to,
		duration = duration,
		ease_type = ease_type,
		callback = callback,
		value = from,
		time_left = duration,
		permanent = false,
		running = false
	}
	
	return setmetatable(Tween, metaTable_TweenUnpacked)
end

-- Tween Handler
hook.Add( "Think", "process_tweens", function()
	if table.IsEmpty(running_tweens) then return end
	
	for tween in next, running_tweens do
		if tween == nil then continue end
		
		tween:Update()
	end
end )