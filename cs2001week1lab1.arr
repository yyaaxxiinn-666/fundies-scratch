use context starter2024
#Q1 T-shirt shop
"Total cost of 5 T shirts:"
(12 + 3) * 5
a = (12 + 3) * 5 #Total cost of 5 T shirts

"Total cost of 7 T shirts:"
(12 + 3) * 7
b = (12 + 3) * 7 #Total cost of 7 T shirts

"Compare 5 T shirts and 7 T shirts:" 
a - b#Compare the results

"print poster perimeter:"
2 * (420 + 594)
"Total poster price:"
perimeter = 2 * (420 + 594)
perimeter * 0.1

#Q2 String Surprises
"Designs for everyone!" + " blue" + " red"
"blue" + " red"

#Q3 Make a Traffic Light
#All objects
body1 = rectangle(200, 120, "solid", "black")
red_l = circle(60, "solid", "red")
light1 = overlay(red_l, body1)

body2 = rectangle(200, 120, "solid", "black")
yellow_l = circle(60, "solid", "yellow")
light2 = overlay(yellow_l, body2)

body3 = rectangle(200, 120, "solid", "black")
green_l = circle(60, "solid", "green")
light3 = overlay(green_l, body3)

light4 = above(light1, (above(light2, light3)))

body4 = rectangle(20, 80, "solid", "grey")

lightf = below(body4, light4)

lightf

#Q4 Broken Code Hunt
# Goal: A rectangle with width 50 and height 20, solid black
"Rectangle:"
rectangle(50, 20, "solid", "black")
"circle:"
circle(30, "solid", "red")

#Q5 Texas Flag Design
#at least three shapes.
body5 = rectangle(100, 50, "solid", "blue")
body6 = rotate(45, star-polygon(30, 5, 2, "solid", "white"))
flag1 = overlay(body6, body5)


flag2 = beside(flag1, rectangle(100, 50, "solid", "white"))

flag3 = above(flag2, rectangle(200, 50, "solid", "red"))
flag3

"testing for this lab"