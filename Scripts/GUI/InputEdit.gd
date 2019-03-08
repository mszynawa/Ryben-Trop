extends LineEdit

func _on_InputEdit_text_entered(new_text):
	var nick = "Anon"
	if new_text != "": nick = new_text
	self.text = nick
	print(nick)