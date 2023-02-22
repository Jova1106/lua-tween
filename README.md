# A GMod Lua Tween object
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
