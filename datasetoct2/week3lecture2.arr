use context dcic2024
include csv
include data-source
check:
  table: date :: String, activity :: String, duration :: Number
  row: "2026-04-01", "Running", 30
  row: "2026-04-02", "Swimming", 20
  row: "2026-04-03", "Cycling", 60
  end
  
is
  table: date :: String, activity :: String, duration :: Number
  row: "2026-04-01", "Running", 30
  row: "2026-04-02", "Swimming", 20
  row: "2026-04-03", "Cycling", 60
  end
  
end



workouts = table: date :: String, activity :: String, duration :: Number
  row: "2026-04-01", "Running", 30
  row: "2026-04-02", "Swimming", 20
  row: "2026-04-03", "Cycling", 60
end

first-row = workouts.row-n(0)
first-row

first-row['activity']
workouts.row-n(0)["duration"]

#to get number of rows in workouts
workouts.length()

#to get all values in a specific colum
workouts.get-column("activity")

#some basic stats
mean(workouts, "duration")
median(workouts, "duration")
sum(workouts, "duration")
stdev(workouts, "duration")
modes(workouts, "activity")


#import csv from the url
recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/recipes.csv", default-options)
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end
recipes
recipes.length()
mean(recipes, "prep-time")

histogram(recipes, 'prep-time', 50)

box-plot(recipes, 'servings')

bp = box-plot(recipes, 'servings')
