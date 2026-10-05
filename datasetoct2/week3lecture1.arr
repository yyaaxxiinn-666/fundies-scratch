use context starter2024
# Boolean Values, it's named after the mathematician George Bool.
#Booleans only have two possibilities: True & False

check:
  true is true
  not(true) is false
end

check:
  true is true
  not(true) is false
  
  # and
  true and true is true
  false and true is false
  (4 < 5) and ((4 + 2) == 6) is true
  
  # or
  true or false is true
  false or false is false
  (4 > 5) or ("a" == "b") is false
end




#The choose-hat Function
#Doc is a very useful string for other people to use the function you have created.
fun choose-hat(
    temp-in-C :: Number) 
  -> String:
  doc:"determines appropriate heaad gear, with above 27C a sun hat, below nothing"
  if temp-in-C > 27:
    "sun hat"
    else:
    "no hat"
  end
where:
  choose-hat(25) is "no hat"
  choose-hat(35) is "sun hat"
  choose-hat(27) is "no hat"
end



#the process of fixing the error is called debugging, and we will use "spy"
fun choose-hat-spy(temp-in-C :: Number) -> String:
  doc: "determines appropriate head gear, with above 27C a sun hat, below nothing"
  spy:
    temp-in-C,
    #there should a comma, if you are writing to conditions
    comparison: temp-in-C > 27
  end
  #remeber to always end the block
  if temp-in-C >= 27:
    "sun hat"
  else:
    "no hat"
  end
where:
  choose-hat-spy(25) is "no hat"
  choose-hat-spy(32) is "sun hat"
  choose-hat-spy(27) is "sun hat"
end
#this is what we use to find where the error is 


#|
   The full design recipe
  Four steps: do them in this order, and write the code last
   1.Type annotation:what goes in, and what comes out
   (ex.(temp-in-C :: Number) -> String:),if we don't do this      ,this could cause errors.
   
   2.Docstring:one Englih sentence saying hwat it is for
   3.Examples:concrete input.output paris in a where: block
   4.Code: the body, written last
|#
    


#if/else and ask expressions
x=0

if x == 0:
  1
else if x > 0:
  x * 2
else:
  x * -1
end


#ask expression
#|
ask:
  | x == 0 then: 1
  | x > 0 then: x * 2
  | otherwise: x * -1
end
|#

fun grade(marks :: Number) -> String:
  doc:"retuns the letter grade for a mark out of 100"
  
  if marks >= 90:
    "A"
  else if marks >= 80:
    "B"
  else if marks >= 70:
    "C"
  else if marks >= 60:
    "D"
  else:
    "F"
  end
  
where:
  grade(95) is "A"
  grade(85) is "B"
  grade(75) is "C"
  grade(65) is "D"
  grade(45) is "F"
  #The boundries
  grade(90) is "A"
  grade(60) is "D"
  grade(59) is "F"
  grade(100) is "A"
  grade(0) is "F"
  
end

# change a way of doing it with "ask"

fun grade-ask(marks :: Number) -> String:
  doc:"using the grade system with a different way of ask"
  ask:
    | marks >= 90 then:"A"
    | marks >= 80 then:"B"
    | marks >= 70 then:"C"
    | marks >= 60 then:"D"
    |otherwise: "F"
end
  
  where:
  grade-ask(95) is "A"
  grade-ask(85) is "B"
  grade-ask(75) is "C"
  grade-ask(65) is "D"
  grade-ask(45) is "F"
  #The boundries
  grade-ask(90) is "A"
  grade-ask(60) is "D"
  grade-ask(59) is "F"
  grade-ask(100) is "A"
  grade-ask(0) is "F"
  
end
