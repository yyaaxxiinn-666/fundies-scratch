use context starter2024
#Q1
fun leap-year-check(year :: Number) -> Boolean:
  doc: "check if this year is a leap year or not"
  if num-remainder(year, 4) == 0:
    true
  else:
    false  
end    
where:
  leap-year-check(2026) is false
  leap-year-check(2020) is true
  
end
  
  
  
#Q2

  
#Q3
  #  ask
  #Case1
  #Case2
  #Case3
#otherwise: "invalid"
  #end
  
 
#Q5
year :: Number
day :: Number

order-by(dataset, "feature, true table)