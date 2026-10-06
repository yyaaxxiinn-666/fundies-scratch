use context dcic2024
include csv

#compute-sum(2, 6)
orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00 #index2
  row: "11:00", 3.95 #index3
  row: "14:00", 4.95 #index4
  row: "16:45", 7.95
end

fun is-high-value(o :: Row) -> Boolean:
  o["amount"] >= 8.0
where:
  is-high-value(orders.row-n(2)) is true
  is-high-value(orders.row-n(4)) is false
end

new-high-orders = filter-with(orders, is-high-value)

high-value-orders = table: time, amount
  row: "08:00", 10.50
  row: "10:15", 8.00
end

filter-with(orders, lam(o): o["amount"] >= 8.0 end)

#order-by
order-by(orders, "amount", true) #ascending

order-by(orders, "amount", false) #decending





fun compute-sum(first-number :: Number, second-number :: Number) -> Number:
  doc:"this function takes two numbers and compute their sum"
  first-number + second-number
where:
  compute-sum(2, 3) is 5
  compute-sum(9, 9) is 18
  compute-sum(6, 7) is 13
end


photos = load-table:
  location :: String,
  subject :: String,
  date :: String
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/photos.csv", default-options)
end

filter-with(photos, lam(r): r["subject"] == "Forest" end)
