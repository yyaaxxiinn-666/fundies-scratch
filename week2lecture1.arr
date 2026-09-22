use context starter2024
include image
#radius below is a 'name'
#we can read the following line as 'radius is defined to be 9'
raduis = 9 #this complete statement is a definition

#few more examples of definitions
books-qualtity = 5

weight = 70

height-a = 170

#expression, code that computese smething
weight * height-a

#statement -> code that instructs rather than computes
#desinition is a statement




#height-b = 160
#height-b = 180
#height-list = [160, 170, 155, 188, 190, 130, 150]



#example2
#include image must be at the top of the code because all the library need to be at the very top top

#define width
rect-width = 140

#define length
rect-length = 40

flag-before = above(rectangle(rect-width, rect-length, "solid", "red"),
  rectangle(rect-width, rect-length, "solid", "green"))

flag-before


#excercise1
#define length of triangle
triangle-length = 35

orange_triangle = triangle(triangle-length, "solid", "orange")

#define length of the square
square_L = 59
blue_square = square(square_L, "solid", "slate-blue")

blue_square

#3rd excersise
side-length = 60
square-color = 'seagreen'

#seagreen = 'seagreen'
named_square = square(side-length, "solid", square-color)

named_square

plain-square = square(60, "solid", "seagreen")

check "same image, different code":
  named_square is plain-square
end

#example of using check
area = 3 * 5

check "area is 15":
  area is 15
end

#excercise 5
circle-r = 20
circle-color = 'yellow'
top_circle = circle(circle-r, "solid", circle-color)

rectangle_L = 100
rectangle_W = 40
rectangle_color = 'black'
rectangle_1 = rectangle(rectangle_L, rectangle_W, "solid", rectangle_color)

above(top_circle, rectangle_1)



#excercise 5 prfessor ex
badge-none = overlay(circle(15, "solid", "yellow"),
  rectangle(90, 60, "solid", "black"))

dot-radius = 15
badge-some = overlay(circle(dot-radius, "solid", "yellow"),
    rectangle(90, 60, "solid", "black"))

#named parts, not just named numbers
lamp = circle(dot-radius, "solid", "yellow")
plate-width = 90
plate-height = 60
plate = rectangle(plate-width, plate-height, "solid", "black")

badge-lots = overlay(lamp, plate)
badge-lots

check "all three badges are identical":
  badge-none is badge-some
  badge-some is badge-lots
end






#Excercise 6

