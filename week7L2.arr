use context dcic2024
#|
   fun f(fp :: Footprint) -> ...:
   cases (footprint) fp:
   | split(name, left, right) => ... f(left) ... f(right) ...
   | activity (name, kg) => ....
|#

data Footprint:
  | split(name :: String, left :: Footprint, right :: Footprint)
  | activity(name :: String, kg :: Number)
end

car = activity("car", 900)
flights = activity("flight", 1500)
heating = activity("heating", 1100)

travel = split("travel", car, flights)
my-footprint = split("my year", travel, heating)

#what is the total co-2?
fun total-co2(fp :: Footprint) -> Number:
  cases (Footprint) fp:
    | split(name, left, right) => total-co2(left) + total-co2(right)
    | activity(name, kg) => kg
  end
where:
  total-co2(car) is 900
  total-co2(my-footprint) is 3500
end


fun count-splits(fp :: Footprint) -> Number:
  cases(Footprint) fp:
    | split(name, left, right) =>
      1 + count-splits(left) + count-splits(right)
    | activity(name, kg) => 0
  end
where:
  count-splits(car) is 0
  count-splits(my-footprint) is 2
  count-splits(travel) is 1
end

fun total-co2-left(fp :: Footprint) -> Number:
  cases(Footprint) fp:
    | split(name, left, right) => total-co2-left(left)
    | activity(name, kg) => kg
  end
end

check "only the left-most activity is counted":
  total-co2-left(car) is 900
  total-co2-left(my-footprint) is 900
end

  
