extends Area2D

var mouse_over = false
var money = 100
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "MONEY: \n" + str(money)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# called every time there is an input event
# potentially used to change cursor!
func _input(event):
		if (event is InputEventMouseButton) && event.pressed &&	mouse_over:
			pass
			
func _on_obj_mouse_entered():
	mouse_over = true

func _on_obj_mouse_exited():
	mouse_over = false


func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton) && event.pressed:
		$PopupMenu.popup()


func _on_Button_pressed():
	
	if  (money >= 1 and $LeftoversPic.visible==false):
		$LeftoversPic.visible = true
		$ComadoreRedPic.visible = false
		$KebabPic.visible = false
		money_change(-1)
		$PopupMenu.hide()
	
func _on_boozeButton_pressed():
	if (money >= 10 and $ComadoreRedPic.visible==false):
		$KebabPic.visible = false
		$LeftoversPic.visible = false
		$ComadoreRedPic.visible = true
		money_change(-10)
		$PopupMenu.hide()
	

func _on_kebabButton_pressed():
	if  (money >= 10 and $KebabPic.visible==false):
		$KebabPic.visible = true
		$LeftoversPic.visible = false
		$ComadoreRedPic.visible = false
		money_change(-10)
		$PopupMenu.hide()
	
func money_change(ammount):
	if money + ammount >= 0:
		money = (money + ammount)
		$Label.text = "MONEY: \n" + str(money)



