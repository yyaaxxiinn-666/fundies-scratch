use context dcic2024
include csv
include data-source

#|
   plan a task before coding it
   finding and cleaning dirty data
   visualisation
|#


#task plan is a to-do list you ca check off

#|
   input = the columns you start from
   output = a complete example of what you want at the end
   steps = small enough that each one is a single function or operation
   tools = the operation for each stp: filter-with, transform-column
      
   
   
|#

#load voters data
voter-data = load-table: VoterID, DOB, Party, Address, City, County, Postcode
source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/voters.csv", default-options)
end

#voter-data.row-n(0)["VoterID"]

#confirm the party problem
filter-with(voter-data, lam(r): r["Party"] == "Labour" end). length() #=>4

voter-data.row-n(3)["Party"] #=>Labour

order-by(count(voter-data, "Party"), "count", false)

fun get-column(r :: Row, colname :: String):
  doc: "returns the calue in row r for the column colname"
  r[colname]
where:
  get-column(voter-data.row-n(3), "Party") is "Labuor"
  get-column(voter-data.row-n(0), "VoterID") is "1"
end
filter-with(voter-data, lam(r): get-column(r, "Party") == "Labour" end).length()
get-column(voter-data.row-n(3), "Party")

with-year =build-column(voter-data, "BirthYear", 
  lam(r): string-substring(get-column(r, "DOB"), 6, 10)end)

get-column(with-year.row-n(0), "BirthYear")
 
#fixing the typo
fun fix-labour(s :: String) -> String:
  doc: "corrects the one known misspelling of Labour"
  if s == "Labuor" : "Labour" #missplelling of labour party
  else if s == "" : "No Party" #fill in missing values with "No Party"
  else: s
  end
    
  #if s == "" : "None" 
  #else: s end
 
where:
  fix-labour("Labuor") is "Labour"
  #fix-labour("") is "None"
  fix-labour("Green Party") is "Green Party"
end

#try using transform-solumn
fixed = transform-column(voter-data, "Party", fix-labour)

freq-bar-chart(fixed, "Party")
