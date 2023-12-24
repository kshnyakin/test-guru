class BadgeLevelChecker
  def initialize(user, badge)
    @user = user
    @badge = badge
  end

  def call
    test_ids_with_template_level = Test.where(level: @badge.award_condition.to_i).pluck(:id).sort
    user_successful_test_ids =
      GetUserSuccessfulPassedTestsByIds.new(@user, test_ids_with_template_level).call
    return unless test_ids_with_template_level == user_successful_test_ids

    BadgeAwarder.new(@user, @badge).call
  end
end
