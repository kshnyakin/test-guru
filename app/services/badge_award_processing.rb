# frozen_string_literal: true

class BadgeAwardProcessing
  def initialize(user, test_passing)
    @user = user
    @test_passing = test_passing
  end

  def call
    badges_categories_processing
    level_test_processing
    attempt_count_processing
  end

  private

  def attempt_count_processing
    attempts_badge_template = BadgeTemplate.find_by(issuance_type: 'test_by_attempts_number')
    old_test_passings = @user.test_passings.where(test_id: @test_passing.test_id).where.not(id: @test_passing.id)
    binding.pry
    assign_bage_to_user(attempts_badge_template) if old_test_passings.empty?
  end

  def level_test_processing
    level_badge_template = BadgeTemplate.find_by(issuance_type: 'all_tests_by_level')
    check_level_badge(level_badge_template)
  end

  def check_level_badge(level_badge_template)
    test_ids_with_template_level = Test.where(level: level_badge_template.level).pluck(:id).sort
    user_successful_test_ids = get_successful_passed_tests(test_ids_with_template_level)
    return unless test_ids_with_template_level == user_successful_test_ids

    assign_bage_to_user(level_badge_template)
  end

  def badges_categories_processing
    category_badge_template = BadgeTemplate.find_by(issuance_type: 'all_tests_by_category')
    check_category_badge(category_badge_template)
  end

  def check_category_badge(category_badge_template)
    category = Category.find(category_badge_template.category_id)
    category_tests_ids = category.tests.map { |test| test.id }.sort
    user_successful_test_ids = get_successful_passed_tests(category_tests_ids)
    return unless category_tests_ids == user_successful_test_ids

    assign_bage_to_user(category_badge_template)
  end

  def get_successful_passed_tests(test_ids_arr)
    @user
      .test_passings
      .where(test_id: test_ids_arr)
      .where(successful: true)
      .pluck(:test_id)
      .uniq
      .sort
  end

  def assign_bage_to_user(badge_template)
    badge_template.badges.create(user_id: @user.id)
  end
end
