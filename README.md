# A GMod Lua Tween object
# Example Clientside Usage:

	local vector2_tween = Tween(Vector2(500, 400), Vector2(700, 500), 1, TWEEN_EASE_QUAD_IN_OUT)
	local number_tween = Tween(300, 20, 0.5, TWEEN_EASE_QUAD_OUT)
	local vector_tween = Tween(Vector(0,0,0), Vector(100,100,100), 3, TWEEN_EASE_LINEAR)

	timer.Simple( 1.25, function()
		vector2_tween:Start()
		number_tween:Start()
		vector_tween:Start()
	end )
	
	hook.Add( "HUDPaint", "draw_2d_tweens", function()
		local vector2_tween_value = vector2_tween:GetValue()
		draw.RoundedBox( 0, vector2_tween_value.x, vector2_tween_value.y, 50, 100, Color( 255, 0, 0 ) )
		local number_tween_value = number_tween:GetValue()
		draw.RoundedBox( 0, 500, 650, number_tween_value, 20, Color( 255, 0, 0 ) )
	end )

	hook.Add("PostDrawTranslucentRenderables", "draw_3d_tweens", function()
		local vector_tween_value = vector_tween:GetValue()
		render.SetColorMaterial()
		render.DrawSphere(vector_tween_value, 50, 10, 10, Color(255, 0, 0))
	end )
