# A GMod Lua Tween object
### Supported Tween Types:
```
Number
Vector2
Vector
Color
Angle
BSpline/Bezier Curve
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

-- Bezier Tween
function tween.DrawBezier(points, color)
	if table.IsEmpty(points) then return end
	render.SetColorMaterial()
	color = color or color_white
	local len = #points

	for i = 1, len do
		local p1 = points[i]
		local p2 = points[i+1] or points[i]
		
		if i < len then
			render.DrawLine(p1, p2, color, true)
		end
		
		render.DrawSphere(p1, .5, 10, 10, color)
	end
end

local delta = 0.05
local bezier_list = {}
local control_points = {
	Vector(0, 0, 0),
	Vector(50, 50, 50),
	Vector(-100, 100,0),
	Vector(150,150,100),
	Vector(200,200, -100),
	Vector(250, 250, 200),
	Vector(300, 300, 0),
	Vector(350, 500, 50),
	Vector(400, 400, 100)
}

for i = 0, 1.01, delta do
	table.insert(bezier_list, tween.BSpline(control_points, i))
end

local bezier_tween = BezierTween(bezier_list, 5, TWEEN_EASE_LINEAR)

bezier_tween:Start()

hook.Add("PostDrawTranslucentRenderables", "Bezier3D", function()
	tween.DrawBezier(bezier_list)

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

### Ease Types Test:
```Lua
local color_red = Color(255, 0, 0, 255)
local tween_duration = 3
local TWEEN_EASE_LINEAR_tween = Tween(10, 300, tween_duration, TWEEN_EASE_LINEAR)
local TWEEN_EASE_IN_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_IN_OUT)
local TWEEN_EASE_SINE_IN_tween = Tween(10, 300, tween_duration, TWEEN_EASE_SINE_IN)
local TWEEN_EASE_SINE_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_SINE_OUT)
local TWEEN_EASE_SINE_IN_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_SINE_IN_OUT)
local TWEEN_EASE_QUAD_IN_tween = Tween(10, 300, tween_duration, TWEEN_EASE_QUAD_IN)
local TWEEN_EASE_QUAD_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_QUAD_OUT)
local TWEEN_EASE_QUAD_IN_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_QUAD_IN_OUT)
local TWEEN_EASE_CUBIC_IN_tween = Tween(10, 300, tween_duration, TWEEN_EASE_CUBIC_IN)
local TWEEN_EASE_CUBIC_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_CUBIC_OUT)
local TWEEN_EASE_CUBIC_IN_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_CUBIC_IN_OUT)
local TWEEN_EASE_QUART_IN_tween = Tween(10, 300, tween_duration, TWEEN_EASE_QUART_IN)
local TWEEN_EASE_QUART_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_QUART_OUT)
local TWEEN_EASE_QUART_IN_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_QUART_IN_OUT)
local TWEEN_EASE_QUINT_IN_tween = Tween(10, 300, tween_duration, TWEEN_EASE_QUINT_IN)
local TWEEN_EASE_QUINT_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_QUINT_OUT)
local TWEEN_EASE_QUINT_IN_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_QUINT_IN_OUT)
local TWEEN_EASE_EXPO_IN_tween = Tween(10, 300, tween_duration, TWEEN_EASE_EXPO_IN)
local TWEEN_EASE_EXPO_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_EXPO_OUT)
local TWEEN_EASE_EXPO_IN_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_EXPO_IN_OUT)
local TWEEN_EASE_CIRC_IN_tween = Tween(10, 300, tween_duration, TWEEN_EASE_CIRC_IN)
local TWEEN_EASE_CIRC_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_CIRC_OUT)
local TWEEN_EASE_CIRC_IN_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_CIRC_IN_OUT)
local TWEEN_EASE_BACK_IN_tween = Tween(10, 300, tween_duration, TWEEN_EASE_BACK_IN)
local TWEEN_EASE_BACK_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_BACK_OUT)
local TWEEN_EASE_BACK_IN_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_BACK_IN_OUT)
local TWEEN_EASE_ELASTIC_IN_tween = Tween(10, 300, tween_duration, TWEEN_EASE_ELASTIC_IN)
local TWEEN_EASE_ELASTIC_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_ELASTIC_OUT)
local TWEEN_EASE_ELASTIC_IN_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_ELASTIC_IN_OUT)
local TWEEN_EASE_BOUNCE_IN_tween = Tween(10, 300, tween_duration, TWEEN_EASE_BOUNCE_IN)
local TWEEN_EASE_BOUNCE_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_BOUNCE_OUT)
local TWEEN_EASE_BOUNCE_IN_OUT_tween = Tween(10, 300, tween_duration, TWEEN_EASE_BOUNCE_IN_OUT)

local tweens = {
	{TWEEN_EASE_LINEAR_tween, "TWEEN_EASE_LINEAR"},
	{TWEEN_EASE_IN_OUT_tween, "TWEEN_EASE_IN_OUT"},
	{TWEEN_EASE_SINE_IN_tween, "TWEEN_EASE_SINE_IN"},
	{TWEEN_EASE_SINE_OUT_tween, "TWEEN_EASE_SINE_OUT"},
	{TWEEN_EASE_SINE_IN_OUT_tween, "TWEEN_EASE_SINE_IN_OUT"},
	{TWEEN_EASE_QUAD_IN_tween, "TWEEN_EASE_QUAD_IN"},
	{TWEEN_EASE_QUAD_OUT_tween, "TWEEN_EASE_QUAD_OUT"},
	{TWEEN_EASE_QUAD_IN_OUT_tween, "TWEEN_EASE_QUAD_IN_OUT"},
	{TWEEN_EASE_CUBIC_IN_tween, "TWEEN_EASE_CUBIC_IN"},
	{TWEEN_EASE_CUBIC_OUT_tween, "TWEEN_EASE_CUBIC_OUT"},
	{TWEEN_EASE_CUBIC_IN_OUT_tween, "TWEEN_EASE_CUBIC_IN_OUT"},
	{TWEEN_EASE_QUART_IN_tween, "TWEEN_EASE_QUART_IN"},
	{TWEEN_EASE_QUART_OUT_tween, "TWEEN_EASE_QUART_OUT"},
	{TWEEN_EASE_QUART_IN_OUT_tween, "TWEEN_EASE_QUART_IN_OUT"},
	{TWEEN_EASE_QUINT_IN_tween, "TWEEN_EASE_QUINT_IN"},
	{TWEEN_EASE_QUINT_OUT_tween, "TWEEN_EASE_QUINT_OUT"},
	{TWEEN_EASE_QUINT_IN_OUT_tween, "TWEEN_EASE_QUINT_IN_OUT"},
	{TWEEN_EASE_EXPO_IN_tween, "TWEEN_EASE_EXPO_IN"},
	{TWEEN_EASE_EXPO_OUT_tween, "TWEEN_EASE_EXPO_OUT"},
	{TWEEN_EASE_EXPO_IN_OUT_tween, "TWEEN_EASE_EXPO_IN_OUT"},
	{TWEEN_EASE_CIRC_IN_tween, "TWEEN_EASE_CIRC_IN"},
	{TWEEN_EASE_CIRC_OUT_tween, "TWEEN_EASE_CIRC_OUT"},
	{TWEEN_EASE_CIRC_IN_OUT_tween, "TWEEN_EASE_CIRC_IN_OUT"},
	{TWEEN_EASE_BACK_IN_tween, "TWEEN_EASE_BACK_IN"},
	{TWEEN_EASE_BACK_OUT_tween, "TWEEN_EASE_BACK_OUT"},
	{TWEEN_EASE_BACK_IN_OUT_tween, "TWEEN_EASE_BACK_IN_OUT"},
	{TWEEN_EASE_ELASTIC_IN_tween, "TWEEN_EASE_ELASTIC_IN"},
	{TWEEN_EASE_ELASTIC_OUT_tween, "TWEEN_EASE_ELASTIC_OUT"},
	{TWEEN_EASE_ELASTIC_IN_OUT_tween, "TWEEN_EASE_ELASTIC_IN_OUT"},
	{TWEEN_EASE_BOUNCE_IN_tween, "TWEEN_EASE_BOUNCE_IN"},
	{TWEEN_EASE_BOUNCE_OUT_tween, "TWEEN_EASE_BOUNCE_OUT"},
	{TWEEN_EASE_BOUNCE_IN_OUT_tween, "TWEEN_EASE_BOUNCE_IN_OUT"},
}

timer.Simple(1.25, function()
	for i = 1, #tweens do
		local tween = tweens[i][1]

		tween:Start()
	end
end)

surface.CreateFont(
	"TweenTestFont",
	
	{
		size = 15,
		weight = 1500,
		shadow = true,
	}
)

concommand.Add("tween_reset_test", function()
	for i = 1, #tweens do
		local tween = tweens[i][1]

		tween:Stop()
		tween.value = tween.from

		timer.Simple(1.25, function()
			tween:Start()
		end)
	end
end)

hook.Add("DrawOverlay", "tween_ease_types_test", function()	
	for i = 1, #tweens do
		local tween_tbl = tweens[i]
		local tween = tween_tbl[1]
		local label = tween_tbl[2]
		local tween_value = tween:GetValue()
		
		draw.RoundedBox(0, (ScrW() - 300) / 2, 100 + 20 * i, tween_value, 19, color_red)
		draw.SimpleText(label, "TweenTestFont", ScrW() / 2, 100 + 19/2 - 1 + 20 * i, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end)
```