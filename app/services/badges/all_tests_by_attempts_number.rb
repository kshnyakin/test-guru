module Badges
  class AllTestsByAttemptsNumber < BaseRuleSpecification

    def satisfy?
      old_test_passings = 
        @test_passing.user.test_passings.where(test_id: @test_passing.test_id).where.not(id: @test_passing.id)
      old_test_passings.size < @rule_value.to_i
    end

  end
end
