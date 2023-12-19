class BadgeCategoryChecker
  def initialize(user, badge_template)
    @user = user
    @badge_template = badge_template
  end

  def call
    category = Category.find(@badge_template.category_id)
    category_tests_ids = category.tests.map { |test| test.id }.sort
    user_successful_test_ids =
      GetUserSuccessfulPassedTestsByIds.new(@user, category_tests_ids).call
    return unless category_tests_ids == user_successful_test_ids

    BadgeAwarder.new(@user, @badge_template).call
  end
end
