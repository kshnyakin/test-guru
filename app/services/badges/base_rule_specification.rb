module Badges
  class BaseRuleSpecification

    def initialize(test_passing:, rule_value:)
      @rule_value = rule_value
      @test_passing = test_passing
    end

    def satisfy?
      raise "Method Satisfy is not defined for #{self.class}"
    end

    private

    def get_user_successful_passed_tests_by_ids(user, checking_test_ids)
      user
      .test_passings
      .where(test_id: checking_test_ids)
      .where(successful: true)
      .pluck(:test_id)
      .uniq
      .sort
    end
  end
end
