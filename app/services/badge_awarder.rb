# frozen_string_literal: true

class BadgeAwarder
  def initialize(user, badge)
    @user = user
    @badge = badge
  end

  def call
    @user.issued_awards.create!(badge_id: @badge.id)
  end
end
