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


#Q2
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
fun rock-paper-scissors(player1 :: String, player2 :: String) -> String:
  doc: "rock, paper, scissors game who's win"
  ask:
    | (player1 == player2) then: "tie"
    | (player1 == "rock") and (player2 == "paper") then: "player2"
    | (player1 == "rock") and (player2 == "scissors") then: "player1"
    | (player1 == "paper") and (player2 == "rock") then: "player1"  
    | (player1 == "paper") and (player2 == "scissors") then: "player2"  
    | (player1 == "scissors") and (player2 == "paper") then: "player1"  
    | (player1 == "scissors") and (player2 == "rock") then: "player2"  
    | otherwise: "invalid choice"
  end
where:
  rock-paper-scissors("rock", "rock") is "tie"
  rock-paper-scissors("paper", "scissors") is "player2"
  rock-paper-scissors("scissors", "rock") is "player2"
  rock-paper-scissors("rrr", "rock") is "invalid choice"

end


#Q4




#Q5
#year :: Number
#day :: Number

#order-by(dataset, "feature, true table)