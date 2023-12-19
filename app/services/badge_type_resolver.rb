# frozen_string_literal: true

class BadgeTypeResolver
  def initialize(user, test_passing, badge_template)
    @user = user
    @test_passing = test_passing
    @badge_template = badge_template
  end

  def call
    case @badge_template.issuance_type
    when 'all_tests_by_category'
      BadgeCategoryChecker.new(@user, @badge_template).call
    when 'all_tests_by_level'
      BadgeLevelChecker.new(@user, @badge_template).call
    when 'test_by_attempts_number'
      BadgeAttemptsChecker.new(@user, @badge_template, @test_passing).call
    end
  end
end
