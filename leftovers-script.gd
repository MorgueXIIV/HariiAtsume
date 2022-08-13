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
		
func clear_table():
			$KebabPic.visible = false
			$LeftoversPic.visible = false
			$ComadoreRedPic.visible = false

func _on_Button_pressed(n,food):
	if  (money >= n and food.visible==false):
		clear_table()
		food.visible=true
		money_change(-n)
		$PopupMenu.hide()
		$Timer.start()

func _on_leftoversButton_pressed():
	_on_Button_pressed(1,$LeftoversPic)

func _on_boozeButton_pressed():
	_on_Button_pressed(10,$ComadoreRedPic)

func _on_kebabButton_pressed():
	_on_Button_pressed(10,$KebabPic)
	
func money_change(ammount):
	if money + ammount >= 0:
		money = (money + ammount)
		$Label.text = "MONEY: \n" + str(money)

func _on_Timer_timeout():
	if ( $BasicHarry.visible ) :
		$BasicHarry.visible = false
		money_change(5)
	else: 
		if ($KebabPic.visible  or $LeftoversPic.visible  or $ComadoreRedPic.visible):
			clear_table()
			$BasicHarry.visible = true
