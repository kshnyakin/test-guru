# frozen_string_literal: true

class BadgeAwardProcessing

  BADGE_RULES = {
    'all_tests_by_level' => 'Badges::AllTestsByComplexityLevel',
    'test_by_attempts_number' => 'Badges::AllTestsByAttemptsNumber',
    'all_tests_by_category_id' => 'Badges::AllTestsByCategory'
  }.freeze  

  def initialize(user, test_passing)
    @user = user
    @test_passing = test_passing
  end

  def call
    Badge.find_each do |badge|
      add_badges(badge) if BADGE_RULES[badge.award_type].constantize.new(
        test_passing: @test_passing, rule_value: badge.award_condition
      ).satisfy?
    end
  end

  private

  def add_badges(badge)
    @user.issued_awards.create!(badge_id: badge.id)
  end
end
