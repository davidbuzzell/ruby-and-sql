# This is a Rails app and we want to load all the files in the app
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along-complete/4-tests.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
Contact.destroy_all
Rails.logger.info "------------------------"
Rails.logger.info "----- FRESH START! -----"
Rails.logger.info "------------------------"
# **************************

# ================================================
# Phase 1: Manual Tests
# ================================================
# What is a test?  It's just code that checks other code.
# We already do this mentally -- "I inserted a row, let me check the count."
# A test automates that check so we don't have to remember to do it.

puts ""
puts "=============================="
puts "Phase 1: Manual Tests"
puts "=============================="

# --- Test: Create a company ---

company = Company.new
company["name"] = "Nike"
company["city"] = "Beaverton"
company["state"] = "OR"
company.save

if Company.all.count == 1
  puts "PASS: create - company count is 1"
else
  puts "FAIL: create - expected 1 company, got #{Company.all.count}"
end

# --- Test: Read a company ---

found = Company.find_by({ "name" => "Nike" })

if found != nil && found["city"] == "Beaverton"
  puts "PASS: read - found Nike in Beaverton"
else
  puts "FAIL: read - could not find Nike or city didn't match"
end

# --- Test: Update a company ---

found["url"] = "https://www.nike.com"
found.save

# re-read from the database to confirm persisted
updated = Company.find_by({ "name" => "Nike" })

if updated["url"] == "https://www.nike.com"
  puts "PASS: update - url is now https://www.nike.com"
else
  puts "FAIL: update - expected https://www.nike.com, got #{updated["url"]}"
end

# --- Test: Delete a company ---

updated.destroy

if Company.all.count == 0
  puts "PASS: delete - company count is 0"
else
  puts "FAIL: delete - expected 0 companies, got #{Company.all.count}"
end

# ================================================
# Phase 2: Real Tests (Minitest)
# ================================================
# Rails comes with a built-in test framework called Minitest.
# Test files live in the test/ directory.
# Open and look at these files:
#   test/models/company_test.rb
#   test/models/contact_test.rb
#
# To run the tests, use the terminal command:
#   rails test

# ================================================
# TDD Exercise: Validations
# ================================================
# TDD = Test-Driven Development
# The idea: write the test FIRST, watch it fail,
# then write the code to make it pass.
#
# 1. Open test/models/contact_test.rb -- read the tests
# 2. Run: rails test
#    -- "contact without company_id should not save" FAILS
#    -- right now, Contact has no validations so save always works
# 3. Open app/models/contact.rb and add:
#      validates :company_id, presence: true
# 4. Run: rails test
#    -- all tests should PASS

# ================================================
# Regression Example
# ================================================
# See code-along-complete/5-introduce-bug.rb
