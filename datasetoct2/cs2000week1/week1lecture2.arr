use context starter2024
#Include image
2 + 3
a = 'Hello World'

b = a + ' '

string-length(b)
string-repeat(b, 3)

"CS" + "2000"

#to convert all string charaters to upper case
string-to-upper("hello cs2000!") # -> HELLO CS2000!
string-toupper("hello cs2000!") # -> HELLO CS2000!

#to convert all string characters to lower case
string-to-lower("WELCOME TO CS 2000") # -> HELLO CS2000!

string-substring("Welcome to London", 0, 7) # ->Welcome

sample_string = "Hello, how are you? My name is Yaxin, and I am from Texas"

#to check if certain characters exist in a string
string-contains(sample_string, "Yaxin")

string-contains(sample_string, "yaxin")

#Excercise
"Check this sentence:"
string-toupper("I want to go travel")
sample_string_a = "I WANT TO GO TRAVEL"
string-contains(sample_string_a, "TRAVEL")
string-contains(sample_string_a, "travel")

#Class lecture
circle(30, "solid", "green")

rectangle(40, 20, "solid", "red")

triangle(50, "outline", "yellow")


triangle(60, "solid", "yellow")


#composition, each of htese takes two imahes and gives back one image
#overlay((first image), (second image))
"overlay:"
overlay(circle(30, "solid", "blue"), rectangle(80, 60, "solid", "yellow"))

#above((first image), (second image))
"above:"
above(circle(30, "solid", "blue"), rectangle(80, 60, "solid", "yellow"))

#below((first image), (second image))
"below:"
below(circle(30, "solid", "blue"), rectangle(80, 60, "solid", "yellow"))

#beside((first image), (second image))
"beside:"
beside(circle(30, "solid", "blue"), rectangle(80, 60, "solid", "yellow"))
