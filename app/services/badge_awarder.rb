# frozen_string_literal: true

class BadgeAwarder
  def initialize(user, badge_templte)
    @user = user
    @badge_template = badge_templte
  end

  def call
    @badge_template.badges.create!(user_id: @user.id)
  end
end
