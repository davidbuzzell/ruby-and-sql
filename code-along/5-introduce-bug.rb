# rails runner code-along/5-introduce-bug.rb

# ================================================
# Regression Example
# ================================================
# What happens when someone accidentally introduces a bug?
# Tests catch it before users do.

# 1. First, confirm all tests pass:
#    rails test

# 2. A developer wants to be "helpful" and make sure
#    contacts always have a company_id, even if one wasn't
#    provided.  They add the following code to the Contact
#    model (app/models/contact.rb).
#
#    Copy and paste this into the Contact class:

#    before_validation :assign_default_company
#
#    def assign_default_company
#      if self["company_id"].blank?
#        self["company_id"] = 0
#      end
#    end

# 3. Run the tests again:
#    rails test

# 4. A test FAILS!  The "helpful" code assigns a bogus
#    company_id of 0, which lets the validation pass --
#    but there is no company with id 0.  Invalid contacts
#    are now sneaking into the database.
#    The test caught the bug before it reached users!

# 5. Remove the code from contact.rb to fix it.
#    Run: rails test -- all tests pass again.
