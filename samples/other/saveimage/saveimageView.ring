# Form/Window View - Generated Source Code File 
# Generated by the Ring 1.10 Form Designer
# Date : 08/02/2019
# Time : 17:02:07

Load "stdlibcore.ring"
Load "guilib.ring"

import System.GUI

if IsMainSourceFile() { 
	new App {
		StyleFusion()
		new saveimageView { win.show() } 
		exec()
	}
}

class saveimageView from WindowsViewParent
	win = new MainWindow() { 
		move(20,20)
		resize(400,400)
		setWindowTitle("Save Image")
		setstylesheet("background-color:;") 
		Button1 = new pushbutton(win) {
			move(30,68)
			resize(172,39)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("Arial")
			setfont(oFont)
			oFont.delete()
			setText("save image")
			setClickEvent(Method(:save))
			setBtnImage(Button1,"")
			
		}
		Label1 = new label(win) {
			move(34,154)
			resize(225,53)
			setstylesheet("color:black;background-color:#dcff79;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,16,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Test!!!")
			setAlignment(Qt_AlignLeft |  Qt_AlignVCenter)
		}
	}

# End of the Generated Source Code File...