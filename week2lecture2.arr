use context starter2024
#reusing string agian and agian
c = "welcome to the class, Grace"
a = "welcome to the class, Ray"

#if there more just write function:
#fun welcome(name, name1, name2):
#  ("welcome to the class, " + name) + ", " + #name1 + ", and " + name2
#end

x = 'yaxin'
y = 'rei'
z = 'grace'

#2
fun area(width, height):
  width * height
end

check:
  area(3, 20) is 3 * 20
  area(4, 50) is 4 * 50
end

#3
fun welcome(name :: String) -> String:
  doc: "returns a greeting adressedto given person"
  "welcome to class, " + name
end

check:
  welcome('yaxin') is 'welcome to class, yaxin'
  welcome('rei') is 'welcome to class, rei'
end

#4
armenia = frame(
  above(rectangle(120, 30, "solid", "red"),
    above(rectangle(120, 30, "solid", "blue"),
      rectangle(120, 30, "solid", "orange"))))

austria = frame(
  above(rectangle(120, 30, "solid", "red"),
    above(rectangle(120, 30, "solid", "white"),
      rectangle(120, 30, "solid", "red"))))

#fun three-stripe-flag(top, middle, bot):
#frame(
#  above(rectangle(120, 30, "solid", top), above(rectangle(120, 30, "solid", middle), rectangle(120, 30, "solid", bot))))
#end



#
fun three-stripe-flag(
    top :: String,
    middle :: String,
    bot :: String
  )
  -> Image:
  doc: "returns a flag with three stripes"
  frame(
    above(rectangle(120, 30, "solid", top),
      above(rectangle(120, 30, "solid", middle),
        rectangle(120, 30, "solid", bot))))
end

check:
  three-stripe-flag("red", "blue", "orange") is armenia
  three-stripe-flag("red", "white", "red") is austria
end

#excercise
#fun area( width :: Number, height :: Number) -> Number:
#  doc: "calculates the area of quadrilateral"
#  width * height
  
#end

#excercise1
#total_cost = 7 * (5 + (string-length("Go Team") * 0.1))

fun total_cost(num_tshirts :: Number, shirt_string :: String) -> Number:
  
  doc: "calculate the price of t-shirt based on quanitiy and number of characters printed on it"
  
  num_tshirts * (5.00 + (string-length(shirt_string) * 0.10))
end

#excercise2
fun celsius-to-fahrenheit(celsius :: Number) -> Number:
doc: "Conberts Celsius to Fahrenheit"

  (celsius * (9 / 5)) + 32
end

#
fun fahrenheit-to-celsius(fahrenheit :: Number) -> Number:
  doc: "Conberts Fahrenheit to Celsius"

  ((fahrenheit - 32) * 5) / 9
end