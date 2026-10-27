use context starter2024
#Q1
fun leap-year-check(year :: Number) -> Boolean:
  doc: "check if this year is a leap year or not"
  if num-modulo(year, 400) == 0:
    true
  else if num-modulo(year, 100) == 0:
    false
  else:
    num-modulo(year, 4) == 0
  end    
where:
  leap-year-check(2026) is false
  leap-year-check(2025) is false
  leap-year-check(2024) is true
  leap-year-check(2020) is true
  leap-year-check(2000) is true
end


#Q2Problem 2 Consider that we can use a number to represent seconds in a minute: any whole number from 0 to 59 (inclusive) is valid, but numbers above or below (or fractions or decimals) are not valid. Design a function tick, that takes a number of seconds and returns the next second, as if a clock were ticking. Be sure that it does the right thing if given 59 seconds is input! Be sure to include a doc string and test cases in a where block.
fun tick(seconds :: Number) -> Number:
  doc: "returns the next second of a given second"
  if seconds < 59:
    seconds + 1
  else:
    0
  end
where:
  tick(59) is 0
  tick(0) is 1
  tick(12) is 13
end

  
    

  
#Q3
  #  ask
  #Case1
  #Case2
  #Case3
#otherwise: "invalid"
  #end
  
 




#Q4




#Q5
#year :: Number
#day :: Number

#order-by(dataset, "feature, true table)