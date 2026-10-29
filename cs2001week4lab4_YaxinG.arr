use context dcic2024
include csv
include data-source

#Q1
flights = load-table:
  rownames :: Number,
  dep_time :: Number,
  sched_dep_time :: Number,
  dep_delay :: Number,
  arr_time :: Number,
  sched_arr_time :: Number,
  arr_delay :: Number,
  carrier :: String,
  flight :: Number,   #Not sure Number or STring?
  tailnum :: String,
  origin :: String,
  dest :: String,
  air_time :: Number,
  distance :: Number,
  hour :: Number,
  minute :: Number, 
  time_hour :: String
  source: csv-table-file("flights.csv", default-options)
  sanitize rownames using num-sanitizer
  sanitize dep_time using num-sanitizer
  sanitize sched_dep_time using num-sanitizer    
  sanitize dep_delay using num-sanitizer
  sanitize arr_time using num-sanitizer
  sanitize sched_arr_time using num-sanitizer    
  sanitize arr_delay using num-sanitizer
  sanitize flight using num-sanitizer
  sanitize air_time using num-sanitizer  
  sanitize distance using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer    
end

fun is_long_flight(row :: Row) -> Boolean:
  doc:"check wether a flight is at least 1500 miles long"
  row["distance"] >= 1500
where:
  is_long_flight(flights.row-n(0)) is false
  is_long_flight(flights.row-n(3)) is true
end

#filter-with(flights, lam(o): o["distance"] >= 1500 end)
long-flights = filter-with(flights, is_long_flight)

long-flights-orderby-air-time = order-by(long-flights, "air_time", false)

carrier-answer = long-flights-orderby-air-time.row-n(0)["carrier"]
origin-answer = long-flights-orderby-air-time.row-n(0)["origin"]
dest-answer = long-flights-orderby-air-time.row-n(0)["dest"]
longest-flight = long-flights-orderby-air-time.row-n(0)
#longest-flight["carrier"]
#longest-flight["origin"]
#longest-flight["dest"]
check "excercise 1":
  carrier-answer is "HA"
  origin-answer is "JFK"
  dest-answer is "HNL"
end


#Q2
fun is_delayed_departure(row :: Row) -> Boolean:
  doc:"find flights that were delayed by at least 30 minutes"
  row["dep_delay"] >= 30
where:
  is_delayed_departure(flights.row-n(97)) is true
  is_delayed_departure(flights.row-n(0)) is false
end

fun is_morning_sched_dep(row :: Row) -> Boolean:
  doc:"checks if the scheduled departure time is before noon"
  row["sched_dep_time"] < 1200
where:
  is_morning_sched_dep(flights.row-n(360)) is false
  is_morning_sched_dep(flights.row-n(0)) is true
end
  
delayed-flights = 
  filter-with(
    flights,
    lam(row): row["dep_delay"] >= 30 end
  )

morning-delayed-flights =
  filter-with(
    delayed-flights,
    lam(row): row["sched_dep_time"] < 1200 end
  )

long-morning-delayed-flights = 
  filter-with(
    morning-delayed-flights,
    lam(row): row["distance"] > 500 end
  )

worst-first = order-by(long-morning-delayed-flights, "dep_delay", false)

flight-answer2 = worst-first.row-n(0)["flight"] #179
origin-answer2 = worst-first.row-n(0)["origin"] #JFK
dep_delay-answer2 = worst-first.row-n(0)["dep_delay"] #337
check "excercise 2":
  flight-answer2 is 179
  origin-answer2 is "JFK"
  dep_delay-answer2 is 337
end


#Q3
clean-dep-delay = 
  transform-column(
    flights,
    "dep_delay",
    lam(delay):
      if delay < 0:
        0
      else:
        delay
      end
    end
)
        
        
