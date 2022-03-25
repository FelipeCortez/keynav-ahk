Gui, horizontal:-Caption +E0x20 +ToolWindow +AlwaysOnTop +LastFound
WinSet, Transparent, 100

Gui, vertical:-Caption +E0x20 +ToolWindow +AlwaysOnTop +LastFound
WinSet, Transparent, 100

Gui, horizontal:Color, Blue
Gui, vertical:Color, Blue
Gui, box:Color, Red

CoordMode, Mouse, Screen

active := false
dragging := false
increment := 80

^;::
x0 := 0
x1 := A_screenWidth
y0 := 0
y1 := A_screenHeight
active := true
Gosub, Redraw
return

#If active
`;::
active := false
if dragging {
   Click, Up
}
dragging := false
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
MouseGetPos, xpos, ypos
x0 := xpos - 100
x1 := xpos + 100
y0 := ypos - 100
y1 := ypos + 100
Gosub, Redraw
return

x::
midx := (x0 + x1) / 2
x0 := midx - 100
x1 := midx + 100
ypos := (y0 + y1) / 2
y0 := ypos - 100
y1 := ypos + 100
Gosub, Redraw
return

d::
Click, Down
dragging := true
return

#IfWinActive
Redraw:
x := (x0 + x1) / 2
y := (y0 + y1) / 2
w := (x1 - x0) / 2
h := (y1 - y0) / 2
Gui, horizontal:Show, x%x% y%y0% NA h%h% w1
Gui, vertical:Show, x%x0% y%y% NA h1 w%w%
if dragging {
   MouseMove, %x%, %y%
}
return
