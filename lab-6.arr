use context dcic2024
#Name:Yaxin Guan

#Task 1
The-cost3-lattes :: Number = 3 * 3.20 #9.6
words-t1 :: String = "Oat" + " " + "latte" #-> Oat latte
string-lt1 :: Number = string-length("cappuccino") #-> 10

check:
  The-cost3-lattes is 9.6
  words-t1 is "Oat latte"
  string-lt1 is 10
end

#Task 2
latte-price :: Number = 3.20

fun order-cost(
  number-of-drinks :: Number,
  price-per-drink :: Number
) -> Number:
  doc: "calculates the total cost of an order"
  number-of-drinks * price-per-drink
where:
  order-cost(3, latte-price) is 9.6
  order-cost(2, 4.50) is 9
end


#Task 3
fun discount-rate(number-of-drinks :: Number) -> Number:
  doc: "returns the discount rate based on the number of drinks"
  if number-of-drinks >= 10:
    0.2
  else if number-of-drinks >= 5:
    0.1
  else:
    0
  end
where:
  discount-rate(4) is 0
  discount-rate(5) is 0.1
  discount-rate(9) is 0.1
  discount-rate(10) is 0.2
end

#Task 4
orders-4 = table: customer, drinks, price
  row: "Amira", 2, 3.20
  row: "Ben", 6, 2.80
  row: "Chen", 12, 3.00
  row: "Dara", 1, 3.50
end

fun order-cost-4(r :: Row) -> Number:
  doc: "returns the cost of one customer's order"
  r["drinks"] * r["price"]
where:
  order-cost-4(orders-4.row-n(0)) is 6.4
  order-cost-4(orders-4.row-n(2)) is 36
end

orders-with-cost-4 = build-column(orders-4, "cost", order-cost-4)

large-orders-4 =
  filter-with(orders-with-cost-4, lam(r): r["drinks"] >= 5 end)

#Task 5
drinks-list = orders-4.get-column("drinks")


fun total-drinks-loop(numbers :: List<Number>) -> Number block:
  var total = 0
  for each(n from numbers):
    total := total + n
  end
  total
where:
  total-drinks-loop([list: 2, 6, 12, 1]) is 21
  total-drinks-loop([list: ]) is 0
end


fun total-drinks-fold(numbers :: List<Number>) -> Number:
  fold(lam(acc, n): acc + n end, 0, numbers)
where:
  total-drinks-fold([list: 2, 6, 12, 1]) is 21
  total-drinks-fold([list: ]) is 0
end


check:
  total-drinks-loop(drinks-list) is 21
  total-drinks-fold(drinks-list) is 21
  total-drinks-loop(drinks-list) is total-drinks-fold(drinks-list)
end


#Task 6
data Order:
  | eat-in(drinks :: Number)
  | takeaway(drinks :: Number, own-cup :: Boolean)
end


fun cup-fee(o :: Order) -> Number:
  doc: "returns the cup fee for an order"
  cases (Order) o:
    | eat-in(drinks) => 0
    | takeaway(drinks, own-cup) =>
        if own-cup:
          0
        else:
          drinks * 0.25
        end
  end
where:
  cup-fee(eat-in(2)) is 0
  cup-fee(takeaway(3, true)) is 0
  cup-fee(takeaway(3, false)) is 0.75
end


fun total-drinks-rec(numbers :: List<Number>) -> Number:
  doc: "returns the sum of the numbers in a list"
  cases (List) numbers:
    | empty => 0
    | link(first, rest) => first + total-drinks-rec(rest)
  end
where:
  total-drinks-rec([list: 2, 6, 12, 1]) is 21
  total-drinks-rec([list: 4]) is 4
  total-drinks-rec([list: ]) is 0
end    
 