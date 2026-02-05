# This is a Rails app and we want to load all the files in the app
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/4-tests.rb

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

# --- Test: Create a company ---

# --- Test: Read a company ---

# --- Test: Update a company ---

# --- Test: Delete a company ---

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
# See code-along/5-introduce-bug.rb
