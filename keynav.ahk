Gui, horizontal:-Caption +E0x20 +ToolWindow +AlwaysOnTop +LastFound
WinSet, Transparent, 100

Gui, vertical:-Caption +E0x20 +ToolWindow +AlwaysOnTop +LastFound
WinSet, Transparent, 100

Gui, horizontal:Color, Blue
Gui, vertical:Color, Blue
Gui, box:Color, Red

CoordMode, Mouse, Screen

active := false
increment := 80

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

3::
Click, Right
return

4::
Click, WheelUp
return

5::
Click, WheelDown
return

<+k::
y0 := y0 - increment
y1 := y1 - increment
Gosub, Redraw
return

<+j::
y0 := y0 + increment
y1 := y1 + increment
Gosub, Redraw
return

<+h::
x0 := x0 - increment
x1 := x1 - increment
Gosub, Redraw
return

<+l::
x0 := x0 + increment
x1 := x1 + increment
Gosub, Redraw
return

c::
midx := (x0 + x1) / 2
x0 := midx - 100
x1 := midx + 100
midy := (y0 + y1) / 2
y0 := midy - 100
y1 := midy + 100
Gosub, Redraw
return

#IfWinActive
Redraw:
x := (x0 + x1) / 2
y := (y0 + y1) / 2
w := (x1 - x0) / 2
h := (y1 - y0) / 2
Gui, horizontal:Show, x%x% y%y0% NA h%h% w1
Gui, vertical:Show, x%x0% y%y% NA h1 w%w%
; Gui, box:Show, x%x0% y%y0% NA h%h% w%w%
return
