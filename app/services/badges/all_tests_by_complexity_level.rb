module Badges
  class AllTestsByComplexityLevel < BaseRuleSpecification
    def satisfy?
      test_ids_with_template_level =
        Test.where(level: @rule_value.to_i).pluck(:id).sort
      user_successful_test_ids =
        get_user_successful_passed_tests_by_ids(@test_passing.user, test_ids_with_template_level)
      test_ids_with_template_level == user_successful_test_ids
    end
  end
end
