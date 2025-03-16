extends Line2D


func _process(delta):
    add_point(get_parent().global_position)
    if points.size() > 15:
        remove_point(0)





# This was the code to make trail start at end of ball based on direction it is going but it bad bad no work I cryyyyyyy
# I think this is due to the radius being wrong due to the sprites square shape or something???? but unsure so oh well.
# var previous_position: Vector2 = Vector2.ZERO
# var ball_radius: float = 0.0

# func _ready():
#     var texture = get_parent().texture
#     ball_radius = texture.get_size().x * 0.5
#     previous_position = get_parent().global_position

# func _process(delta):
#     var current_position = get_parent().global_position
#     var direction = (current_position - previous_position).normalized()

#     add_point(current_position - ball_radius * direction)
#     if points.size() > 10:
#         remove_point(0)
    
#     previous_position = current_position