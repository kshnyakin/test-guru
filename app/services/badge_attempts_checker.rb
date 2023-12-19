class BadgeAttemptsChecker
  def initialize(user, badge_template, test_passing)
    @user = user
    @badge_template = badge_template
    @test_passing = test_passing
  end

  def call
    old_test_passings = @user.test_passings.where(test_id: @test_passing.test_id).where.not(id: @test_passing.id)
    BadgeAwarder.new(@user, @badge_template).call if old_test_passings.empty?
  end
end
