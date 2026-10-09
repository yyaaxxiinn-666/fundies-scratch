use context dcic2024
#|
#1The two operations:
#1.transform-colunm:
#your function takes one value
#you get back same colums, new values in one
#2.build column:
#your function takes one value
#You get back: one extra column
|#

sales=table:item :: String,price :: Number,pty :: Number
  row: "tea", 2.50, 4
  row: "Coffe", 3.00,2
  row: "Cake", 4.25,3
end


#transform column
#add VAT to every price
fun add-vat(p :: Number)->Number:
  doc:"returns the price with 2 percent VAT added"
  p * 1.2
where:
  add-vat(10) is 12
  add-vat(0) is 0
end
with-vat = transform-column(sales,"price",add-vat)
sales.get-column("price")
with-vat.get-column("price")

transform-column(sales, "price", lam(p): p * 1.2 end)
  

#part2
#build-column
fun line-total(r :: Row) -> Number:
  doc:" returns price timmes quantity for one order line"
  r["price"] * r["pty"]
where:
  line-total(sales.row-n(0)) is 10
  line-total(sales.row-n(2)) is 12.75
end
with-total = build-column(sales, "total", line-total)
sales
with-total.get-column("total")

#part3
#chain them; operations compose, because each returns a table.
#ADD VAT, then total the VAT-inclusive prices
billed = build-column(transform-column(sales, "price", add-vat), "total", line-total)
billed
#build-column(sales, "total", line-total)
#transform-column(sales, "price", add-vat)

#excercise
items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
  row: "Sword of Dawn",           23,  -87
  row: "Healing Potion",         -45,   12
  row: "Dragon Shield",           78,  -56
  row: "Magic Staff",             -9,   64
  row: "Elixir of Strength",      51,  -33
  row: "Cloak of Invisibility",  -66,    5
  row: "Ring of Fire",            38,  -92
  row: "Boots of Swiftness",     -17,   49
  row: "Amulet of Protection",    82,  -74
  row: "Orb of Wisdom",          -29,  -21
end
transform-column(
  transform-column(items, "x-coordinate", lam(n): n * 0.9 end),
  "y-coordinate", lam(n): n * 0.9 end  
  )