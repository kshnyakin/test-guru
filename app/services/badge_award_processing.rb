# frozen_string_literal: true

class BadgeAwardProcessing
  def initialize(user, test_passing)
    @user = user
    @test_passing = test_passing
  end

  def call
    return unless @test_passing.successful?

    Badge.all.each do |badge|
      BadgeTypeResolver.new(@user, @test_passing, badge).call
    end
  end
end
