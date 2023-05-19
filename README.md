# A GMod Lua Tween object
### Supported Tween Types:
```
Number
Vector2
Vector
Color
Angle
Bezier (Quadratic/Cubic)
```
## Example Clientside Usage:
### Regular Tween Object:
```Lua
local vector2_tween = Tween(Vector2(500, 400), Vector2(700, 500), 1, TWEEN_EASE_QUAD_IN_OUT)
local number_tween = Tween(300, 20, 0.5, TWEEN_EASE_QUAD_OUT)
local vector_tween = Tween(Vector(0,0,0), Vector(100,100,100), 3, TWEEN_EASE_LINEAR)
local color_tween = Tween(Color(255, 25, 35, 80), Color(75, 185, 40, 150), 1, TWEEN_EASE_QUAD_OUT)

timer.Simple(1.25, function()
	vector2_tween:Start()
	number_tween:Start()
	vector_tween:Start()
	color_tween:Start()
end)

hook.Add("HUDPaint", "draw_2d_tweens", function()
	-- Vector2 Tween
	local vector2_tween_value = vector2_tween:GetValue()
	draw.RoundedBox(0, vector2_tween_value.x, vector2_tween_value.y, 50, 100, Color(255, 0, 0))

	-- Number Tween
	local number_tween_value = number_tween:GetValue()
	draw.RoundedBox(0, 500, 650, number_tween_value, 20, Color(255, 0, 0))

	-- Color Tween
	local color_tween_value = color_tween:GetValue()
	draw.RoundedBox(0, 500, 700, 100, 20, color_tween_value)
end)

hook.Add("PostDrawTranslucentRenderables", "draw_3d_tweens", function()
	-- Vector Tween
	local vector_tween_value = vector_tween:GetValue()
	render.SetColorMaterial()
	render.DrawSphere(vector_tween_value, 50, 10, 10, Color(255, 0, 0))
end)

-- Bezier Tweens
local function Lerp(from, to, t)
	return from + (to - from) * t
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

local bezier_start = Vector(0, 0, 0)
local bezier_end = Vector(100, 100, 0)
local z_diff = math.max(bezier_start.z, bezier_end.z) - math.min(bezier_start.z, bezier_end.z)
local bezier_control_point = (bezier_start+bezier_end)/2 + Vector(0, 0, z_diff+50)
local bezier_control_point2 = (bezier_start+bezier_end)/bezier_start:Distance(bezier_end) + Vector(0, 0, z_diff+50)
local bezier_control_point3 = (bezier_start+bezier_end)/1 + Vector(0, 0, z_diff+50)
local delta = 0.05
local bezier_list = {}
local bezier_type = "quadratic"

for i = 0, 1.01, delta do
	if bezier_type == "quadratic" then
		table.insert(bezier_list, QuadraticBezier(bezier_start, bezier_control_point, bezier_end, i))
	elseif bezier_type == "cubic" then
		table.insert(bezier_list, CubicBezier(bezier_start, bezier_control_point2, bezier_control_point3, bezier_end, i))
	end
end

local bezier_tween = Tween(bezier_start, bezier_end, 1, TWEEN_EASE_LINEAR)

if bezier_type == "quadratic" then
	bezier_tween:SetBezierType("quadratic", bezier_control_point)
elseif bezier_type == "cubic" then
	bezier_tween:SetBezierType("cubic", bezier_control_point2, bezier_control_point3)
end

bezier_tween:Start()

hook.Add("PostDrawTranslucentRenderables", "Bezier3D", function()
	if bezier_type == "quadratic" then
		render.DrawLine(bezier_start, bezier_control_point, color_white, true)
		render.DrawLine(bezier_control_point, bezier_end, color_white, true)
	elseif bezier_type == "cubic" then
		render.DrawLine(bezier_start, bezier_control_point2, color_white, true)
		render.DrawLine(bezier_control_point2, bezier_control_point3, color_white, true)
		render.DrawLine(bezier_control_point3, bezier_end, color_white, true)
	end

	for i = 1, #bezier_list-1 do
		local p = bezier_list[i]
		local nextP = bezier_list[i+1]
		
		render.DrawLine(p, nextP, color_white, true)
	end

	local p = bezier_tween:GetValue()
	render.SetColorMaterial()
	render.DrawSphere(p, 2, 10, 10, color_white)
end)
```

### TweenUnpacked Object:
```Lua
local color = Color(255, 0, 0, 255)
local color_tween = TweenUnpacked(color, Color(255, 25, 35), Color(75, 185, 40, 150), 1, TWEEN_EASE_QUAD_OUT)

timer.Simple(1.25, function()
	color_tween:Start()
end)

hook.Add("HUDPaint", "draw_color_tween", function()
	draw.RoundedBox(0, 500, 650, 100, 20, color)
end)
```

Note: Numbers technically work with TweenUnpacked, but since numbers aren't objects, they can't be manipulated in the same way that an object like a Vector can, so if you try to tween a number with TweenUnpacked, you still have to use tween:GetValue(), or just use the regular Tween object.
