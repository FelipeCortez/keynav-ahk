Gui, horizontal:-Caption +E0x20 +ToolWindow +AlwaysOnTop +LastFound
WinSet, Transparent, 100

Gui, vertical:-Caption +E0x20 +ToolWindow +AlwaysOnTop +LastFound
WinSet, Transparent, 100

Gui, horizontal:Color, Blue
Gui, vertical:Color, Blue

CoordMode, Mouse, Screen

active := false

^;::
x0 := 0
x1 := A_screenWidth
y0 := 0
y1 := A_screenHeight
screenheight := A_screenHeight
screenwidth := A_screenWidth
active := true
Gosub, Redraw
return

#If active
`;::
active := false
Gui, horizontal: Hide
Gui, vertical: Hide
return

h::
x1 := (x0 + x1) / 2
Gosub, Redraw
return

j::
y0 := (y0 + y1) / 2
Gosub, Redraw
return

k::
y1 := (y0 + y1) / 2
Gosub, Redraw
return

l::
x0 := (x0 + x1) / 2
Gosub, Redraw
return

w::
MouseMove, %x%, %y%
return

1::
MouseClick
return

#IfWinActive
Redraw:
x := (x0 + x1) / 2
y := (y0 + y1) / 2
Gui, horizontal:Show, x%x% y0 NA h%screenheight% w1
Gui, vertical:Show, x0 y%y% NA h1 w%screenwidth%
WinSet, Transcolor, 0xFFFFFF
return
