# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database
apple = Company.find_by({"name" => "Apple"})
#@TODO: check that this hash exists!
amazon = Company.find_by({"name" => "Amazon"})

# 1. insert new rows in the contacts table with relationship to a company
contact = Contact.new
contact["first_name"] = "Tim"
contact["last_name"] = "Cook"
contact["email"] = "tcook@apple.com"
contact["company_id"] = apple["id"]
contact.save

contact = Contact.new
contact["first_name"] = "Craig"
contact["last_name"] = "Federighi"
contact["email"] = "cfederighi@apple.com"
contact["company_id"] = apple["id"]
contact.save

contact = Contact.new
contact["first_name"] = "Jeff"
contact["last_name"] = "Bezos"
contact["email"] = "jeff@amazon.com"
contact["company_id"] = amazon["id"]
contact.save

# 2. How many contacts work at Apple?
apple_employees = Contact.where({"company_id" => apple["id"]})

# 3. What is the full name of each contact who works at Apple?
for employee in apple_employees
  puts "#{employee["first_name"]} #{employee["last_name"]}"
end