# frozen_string_literal: true

class BadgeTypeResolver
  def initialize(user, test_passing, badge)
    @user = user
    @test_passing = test_passing
    @badge = badge
  end

  def call
    case @badge.award_type
    when 'all_tests_by_category_id'
      BadgeCategoryChecker.new(@user, @badge).call
    when 'all_tests_by_level'
      BadgeLevelChecker.new(@user, @badge).call
    when 'test_by_attempts_number'
      BadgeAttemptsChecker.new(@user, @badge, @test_passing).call
    end
  end
end
