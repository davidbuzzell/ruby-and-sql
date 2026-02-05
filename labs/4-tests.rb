# This is a Rails app and we want to load all the files in the app
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/4-tests.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
Contact.destroy_all
Rails.logger.info "------------------------"
Rails.logger.info "----- FRESH START! -----"
Rails.logger.info "------------------------"
# **************************

# Lab 4: Tests
# - In the code-along, we wrote manual tests and explored Minitest
#   with the Company and Contact models.  In this lab, you'll practice
#   TDD (Test-Driven Development) by adding validations to Company.

# ================================================
# Part 1: Review and Setup
# ================================================

# 1. Open test/models/company_test.rb and read through the tests.
#    Notice there are two validation tests at the bottom:
#    - "company without name should not save" (already working)
#    - "company name must be unique" (commented out - for Part 2)

# 2. Open app/models/company.rb and add the presence validation:
#      validates :name, presence: true

# 3. Run the tests to confirm they all pass:
#    rails test

# ================================================
# Part 2: TDD - Company Name Uniqueness
# ================================================
# Practice Test-Driven Development: write the test FIRST,
# watch it fail, then write the code to make it pass.

# 4. In test/models/company_test.rb, find the commented-out test:
#    "company name must be unique"
#    Uncomment it.

# 5. Run: rails test
#    The test should FAIL -- right now, nothing prevents
#    duplicate company names from being saved.

# 6. Open app/models/company.rb and update the validation:
#    validates :name, presence: true, uniqueness: true

# 7. Run: rails test
#    All tests should now PASS!

# ================================================
# Reflection
# ================================================
# You just practiced TDD:
# - Write the test first (it fails)
# - Write the code to make it pass
# - Tests protect against future bugs (regressions)
