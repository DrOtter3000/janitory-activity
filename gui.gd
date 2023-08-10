extends Control


func update_action(text):
	$CenterContainer/LblAction.text = str(text)


func update_goobs():
	$GoobCounter.text = str(Gamemanager.goob_counter) + " / " + str(Gamemanager.goobs_on_field)
