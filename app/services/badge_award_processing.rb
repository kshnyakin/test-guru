# frozen_string_literal: true

class BadgeAwardProcessing
  def initialize(user, test_passing)
    @user = user
    @test_passing = test_passing
  end

  def call
    return unless @test_passing.successful?

    BadgeTemplate.all.each do |badge_template|
      BadgeTypeResolver.new(@user, @test_passing, badge_template).call
    end
  end
end
