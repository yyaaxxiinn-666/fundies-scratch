use context dcic2024
include csv
include data-source

recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-file("recipes.csv", default-options)
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end

