module Badges
  class AllTestsByCategory < BaseRuleSpecification

    def satisfy?
      category = Category.find(@rule_value.to_i)
      category_tests_ids = category.tests.map { |test| test.id }.sort
      user_successful_test_ids = 
        get_user_successful_passed_tests_by_ids(@test_passing.user, category_tests_ids)
      category_tests_ids == user_successful_test_ids
    end

  end
end
