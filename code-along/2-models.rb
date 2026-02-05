# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert new rows in companies table
new_company = Company.new
new_company["name"] = "Bose"
new_company["city"] = "Framingham"
new_company["state"] = "MA"
new_company["url"] = "https://www.bose.com"
new_company.save  # Writes updates to the DB

new_company = Company.new
new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "CA"
new_company["url"] = "https://www.apple.com"
new_company.save  # Writes updates to the DB

new_company = Company.new
new_company["name"] = "Amazon"
new_company["city"] = "Seattle"
new_company["state"] = "WA"
new_company["url"] = "https://www.amzn.com"
new_company.save  # Writes updates to the DB

new_company = Company.new
new_company["name"] = "Anthropic"
new_company["city"] = "San Francisco"
new_company["state"] = "CA"
new_company["url"] = "https://www.claude.ai"
new_company.save  # Writes updates to the DB

# 3. query companies table to find all row with California company
all_companies = Company.all
#puts all_companies.inspect
puts "All Companies: #{all_companies.count}"


california_companies = Company.where({ "state" => "CA" })
#puts california_companies.inspect
puts "Companies in California: #{california_companies.count}"

# 4. query companies table to find single row for Apple

# apple = Company.where({ "name" => "Apple" })[0]
apple = Company.find_by({ "name" => "Apple" })
#puts apple.inspect

# 5. read a row's column value

puts "Apple's URL: #{apple["url"]}"  # `apple.url` works too

# 6. update a row's column value

amazon = Company.find_by({ "name" => "Amazon" })
amazon["url"] = "https://www.amazon.com/"  # `amazon.url`
amazon.save

# 7. delete a row

anthropic = Company.find_by({ "name" => "Anthropic" })
anthropic.destroy  # DON'T USE `.delete` for now

# How many rows are in the companies table?
puts "Companies after deleting Anthropic: #{Company.all.count}" # companies: 2

puts "Names of companies:"
for company in all_companies
  puts "\t- #{company["name"]}"
end