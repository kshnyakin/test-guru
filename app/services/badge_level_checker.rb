class BadgeLevelChecker
  def initialize(user, badge_template)
    @user = user
    @badge_template = badge_template
  end

  def call
    test_ids_with_template_level = Test.where(level: @badge_template.level).pluck(:id).sort
    user_successful_test_ids =
      GetUserSuccessfulPassedTestsByIds.new(@user, test_ids_with_template_level).call
    return unless test_ids_with_template_level == user_successful_test_ids

    BadgeAwarder.new(@user, @badge_template).call
  end
end
