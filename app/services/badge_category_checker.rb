class BadgeCategoryChecker
  def initialize(user, badge)
    @user = user
    @badge = badge
  end

  def call
    category = Category.find(@badge.award_condition.to_i)
    category_tests_ids = category.tests.map { |test| test.id }.sort
    user_successful_test_ids =
      GetUserSuccessfulPassedTestsByIds.new(@user, category_tests_ids).call
    return unless category_tests_ids == user_successful_test_ids

    BadgeAwarder.new(@user, @badge).call
  end
end
