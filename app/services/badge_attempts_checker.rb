class BadgeAttemptsChecker
  def initialize(user, badge, test_passing)
    @user = user
    @badge = badge
    @test_passing = test_passing
  end

  def call
    old_test_passings = @user.test_passings.where(test_id: @test_passing.test_id).where.not(id: @test_passing.id)
    BadgeAwarder.new(@user, @badge).call if old_test_passings.size < @badge.award_condition.to_i
  end
end
