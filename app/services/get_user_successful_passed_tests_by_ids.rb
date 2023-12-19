class GetUserSuccessfulPassedTestsByIds
  def initialize(user, checking_test_ids)
    @user = user
    @checking_test_ids = checking_test_ids
  end

  def call
    @user
      .test_passings
      .where(test_id: @checking_test_ids)
      .where(successful: true)
      .pluck(:test_id)
      .uniq
      .sort
  end
end
