extends CharacterBody2D

var leaf_count = 0

func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * 400
	move_and_slide()

func _on_pick_up_area_area_entered(area):
	if area.is_in_group("leaf") and $HeldLeaf.visible == false:
		area.queue_free() # Replace with function body.
		$HeldLeaf.visible = true
		
	if area.is_in_group("Basket") and $HeldLeaf.visible == true:
		$HeldLeaf.visible = false
		leaf_count += 1
		$CanvasLayer/LeafCountDisplay.text = "leaves: " + str(leaf_count)
	
