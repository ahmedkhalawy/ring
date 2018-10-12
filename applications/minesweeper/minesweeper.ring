# Project : Minesweeper Game
# Date    : 2018/09/12
# Author : Gal Zsolt (~ CalmoSoft ~)
# Email   : <calmosoft@gmail.com>

load "stdlib.ring"
load "guilib.ring"

limit = 99
C_ROWCOUNT = 16
C_COLCOUNT = 30
C_SPACING = 5
C_EMPTYBUTTONSTYLE =  'border-radius:17px;background-color:white'
C_BUTTONREDSTYLE = 'border-radius:17px;color:black; background-color: red'
C_BUTTONYELLOWSTYLE = 'border-radius:17px;color:black; background-color: yellow'
C_BUTTONVIOLETSTYLE = 'border-radius:17px;color:black; background-color: violet'
C_BUTTONGRAYSTYLE = 'border-radius:17px;color:black; background-color: gray'
C_MENUSTYLE	= "color:white;background-color:rgb(50,50,50);border-radius:17px"
button = newlist(C_ROWCOUNT,C_COLCOUNT)
mines = dimlist([C_ROWCOUNT,C_COLCOUNT,1])
LayoutButtonRow = list(C_ROWCOUNT+3)

app = new qApp {
         StyleFusion()
         win = new qWidget() {
                  setWindowTitle('Minesweeper Game')
                  move(490,100)
                  resize(800,600)
                  LayoutButtonMain = new QVBoxLayout()
                  LayoutButtonMain.setSpacing(C_SPACING)
                  LayoutButtonMain.setContentsmargins(0,0,0,0)
                  for Row = 1 to C_ROWCOUNT
                       LayoutButtonRow[Row] = new QHBoxLayout() {
                       setSpacing(C_SPACING)
                       setContentsmargins(0,0,0,0)
                       }
                       for Col = 1 to C_COLCOUNT
                            button[Row][Col] = new QPushButton(win) {
                            setstylesheet(C_EMPTYBUTTONSTYLE)
                            setclickevent("pplay(" + string(Row) + "," + string(Col) + ")")
                            setSizePolicy(1,1)
                            }
                            LayoutButtonRow[Row].AddWidget(button[Row][Col])
                            if Row = C_ROWCOUNT and Col = C_COLCOUNT
                            ok
                       next
                       LayoutButtonMain.AddLayout(LayoutButtonRow[Row])
                  next      
                  setLayout(LayoutButtonMain)
                  pbegin()
                  show()
         }
        exec()
         }

func pnumber()
       for m = 2 to C_COLCOUNT-1
            for n = 2 to C_ROWCOUNT-1
                 minesum = 0
                 if mines[n][m-1][1] = 1
                    minesum = minesum + 1
                 ok
                 if mines[n][m+1][1] = 1
                    minesum = minesum + 1
                 ok
                 if mines[n-1][m][1] = 1
                    minesum = minesum + 1
                 ok
                 if mines[n+1][m][1] = 1
                    minesum = minesum + 1
                 ok
                 if mines[n-1][m-1][1] = 1
                    minesum = minesum + 1
                 ok
                 if mines[n+1][m-1][1] = 1
                    minesum = minesum + 1
                 ok
                 if mines[n-1][m+1][1] = 1
                    minesum = minesum + 1
                 ok
                 if mines[n+1][m+1][1] = 1
                    minesum = minesum + 1
                 ok
                 if minesum = 0
                    button[n][m].settext("")
                    if mines[n][m][1] = 1
                       button[n][m] {setbtnimage(self,"mine.png")}
                       win.show()
                    ok
                 else
                    if mines[n][m][1] != 1
                       button[n][m].settext(string(minesum))
                    else
                       button[n][m] {setbtnimage(self,"mine.png")}
                       win.show()
                    ok
                 ok
            next
       next
       minesum = 0
       if mines[2][1][1] = 1
          minesum = minesum + 1
       ok
       if mines[1][2][1] = 1
          minesum = minesum + 1
       ok
       if mines[2][2][1] = 1
          minesum = minesum + 1
       ok
       if minesum = 0
          button[1][1].settext("")
          if mines[1][1][1] = 1
             button[n][m] {setbtnimage(self,"mine.png")}
             win.show()
          ok
       else
          if mines[1][1][1] = 0
             button[1][1].settext(string(minesum))
          else
             button[1][1] {setbtnimage(self,"mine.png")}
             win.show()
          ok
       ok
       minesum = 0
       if mines[C_ROWCOUNT-1][1][1] = 1
          minesum = minesum + 1
       ok
       if mines[C_ROWCOUNT-1][2][1] = 1
          minesum = minesum + 1
       ok
       if mines[C_ROWCOUNT][2][1] = 1
          minesum = minesum + 1
       ok
       if minesum = 0
          button[C_ROWCOUNT][1].settext("")
          if mines[C_ROWCOUNT][1][1] = 1
             button[C_ROWCOUNT][1] {setbtnimage(self,"mine.png")}
             win.show()
          ok
       else
          if mines[C_ROWCOUNT][1][1] = 0
             button[C_ROWCOUNT][1].settext(string(minesum))
          else
             button[C_ROWCOUNT][1] {setbtnimage(self,"mine.png")}
             win.show()
          ok
       ok
       minesum = 0
       if mines[1][C_COLCOUNT-1][1] = 1
          minesum = minesum + 1
       ok
       if mines[2][C_COLCOUNT-1][1] = 1
          minesum = minesum + 1
       ok
       if mines[2][C_COLCOUNT][1] = 1
          minesum = minesum + 1
       ok
       if minesum = 0
          button[1][C_COLCOUNT].settext("")
          if mines[1][C_COLCOUNT][1] = 1
             button[1][C_COLCOUNT] {setbtnimage(self,"mine.png")}
             win.show()
          ok
       else
          if mines[1][C_COLCOUNT][1] = 0
             button[1][C_COLCOUNT].settext(string(minesum))
          else
             button[1][C_COLCOUNT] {setbtnimage(self,"mine.png")}
             win.show()
          ok
       ok
       minesum = 0
       if mines[C_ROWCOUNT][C_COLCOUNT-1][1] = 1
          minesum = minesum + 1
       ok
       if mines[C_ROWCOUNT-1][C_COLCOUNT-1][1] = 1
          minesum = minesum + 1
       ok
       if mines[C_ROWCOUNT-1][C_COLCOUNT][1] = 1
          minesum = minesum + 1
       ok
       if minesum = 0
          button[C_ROWCOUNT][C_COLCOUNT].settext("")
          if mines[C_ROWCOUNT][C_COLCOUNT][1] = 1
             button[C_ROWCOUNT][C_COLCOUNT] {setbtnimage(self,"mine.png")}
             win.show()
          ok
       else
          if mines[C_ROWCOUNT][C_COLCOUNT][1] = 0
             button[C_ROWCOUNT][C_COLCOUNT].settext(string(minesum))
          else
             button[C_ROWCOUNT][C_COLCOUNT] {setbtnimage(self,"mine.png")}
             win.show()
          ok
       ok
       for n = 2 to C_COLCOUNT-1
            minesum = 0
            if mines[1][n-1][1] = 1
               minesum = minesum + 1
            ok
            if mines[1][n+1][1] = 1
               minesum = minesum + 1
            ok
            if mines[2][n-1][1] = 1
               minesum = minesum + 1
            ok
            if mines[2][n+1][1] = 1
               minesum = minesum + 1
            ok
            if mines[2][n][1] = 1
               minesum = minesum + 1
            ok
            if minesum = 0
               button[1][n].settext("")
               if mines[1][n][1] = 1
                  button[1][n] {setbtnimage(self,"mine.png")}
                  win.show()
               ok
            else
               if mines[1][n][1] != 1
                  button[1][n].settext(string(minesum))
               else
                  button[1][n] {setbtnimage(self,"mine.png")}
                  win.show()
               ok
            ok
       next
       for n = 2 to C_ROWCOUNT-1
            minesum = 0
            if mines[C_ROWCOUNT][n-1][1] = 1
               minesum = minesum + 1
            ok
            if mines[C_ROWCOUNT][n+1][1] = 1
               minesum = minesum + 1
            ok
            if mines[C_ROWCOUNT-1][n-1][1] = 1
               minesum = minesum + 1
            ok
            if mines[C_ROWCOUNT-1][n+1][1] = 1
               minesum = minesum + 1
            ok
            if minesum = 0
               button[C_ROWCOUNT][n].settext("")
               if mines[C_ROWCOUNT][n][1] = 1
                  button[C_ROWCOUNT][n] {setbtnimage(self,"mine.png")}
                  win.show()
               ok
            else
               if mines[C_ROWCOUNT][n][1] != 1
                  button[C_ROWCOUNT][n].settext(string(minesum))
               else
                  button[C_ROWCOUNT][n] {setbtnimage(self,"mine.png")}
                  win.show()
               ok
            ok
       next
       for n = 2 to C_ROWCOUNT-1
            minesum = 0
            if mines[n-1][1][1] = 1
               minesum = minesum + 1
            ok
            if mines[n+1][1][1] = 1
               minesum = minesum + 1
            ok
            if mines[n-1][2][1] = 1
               minesum = minesum + 1
            ok
            if mines[n+1][2][1] = 1
               minesum = minesum + 1
            ok
            if minesum = 0
               button[n][1].settext("")
               if mines[n][1][1] = 1
                  button[n][1] {setbtnimage(self,"mine.png")}
                  win.show()
               ok
            else
               if mines[n][1][1] != 1
                  button[n][1].settext(string(minesum))
               else
                  button[n][1] {setbtnimage(self,"mine.png")}
                  win.show()
               ok
            ok
       next
       for n = 2 to C_ROWCOUNT-1
            minesum = 0
            if mines[n-1][C_COLCOUNT][1] = 1
               minesum = minesum + 1
            ok
            if mines[n+1][C_COLCOUNT][1] = 1
               minesum = minesum + 1
            ok
            if mines[n-1][C_COLCOUNT-1][1] = 1
               minesum = minesum + 1
            ok
            if mines[n+1][C_COLCOUNT-1][1] = 1
               minesum = minesum + 1
            ok
            if minesum = 0
               button[n][C_COLCOUNT].settext("")
               if mines[n][C_COLCOUNT][1] = 1
                  button[n][C_COLCOUNT] {setbtnimage(self,"mine.png")}
                  win.show()
               ok
            else
               if mines[n][C_COLCOUNT][1] != 1
                  button[n][C_COLCOUNT].settext(string(minesum))
               else
                  button[n][C_COLCOUNT] {setbtnimage(self,"mine.png")}
                  win.show()
               ok
            ok
       next            

func pplay(m,n) 
       if mines[m][n][1] = 1
          button[m][n].setstylesheet(C_BUTTONREDSTYLE)
          button[m][n] {setbtnimage(self,"mine.png")}
          pnumber()
          win.show()
       else
          button[m][n].setstylesheet(C_BUTTONGRAYSTYLE)
       ok

func pbegin()
       for n = 1 to limit
            x = random(C_COLCOUNT - 1) + 1
            y = random(C_ROWCOUNT - 1) + 1
            mines[y][x][1] = 1
            win.show() 
       next

func dimlist(dimArray)
        sizeList = len(dimArray)
        newParms = []
        for i = 2 to sizeList
            Add(newParms, dimArray[i]) 
        next      
        alist = list(dimArray[1])
        if sizeList = 1
           return aList
        ok
        for t in alist
              t = dimlist(newParms)
        next       
        return alist

func msgBox(cText) 
	mb = new qMessageBox(win) {
	        setWindowTitle('Minesweeper Game')
	        setText(cText)
                setstandardbuttons(QMessageBox_OK) 
                result = exec()
                pbegin() 
        }