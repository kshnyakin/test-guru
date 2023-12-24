class BadgesController < ApplicationController
  def index
    @issued_awards = current_user.issued_awards
    @badges = Badge.all
  end
end
