class BadgeTemplatesController < ApplicationController
  def index
    @badge_templates = BadgeTemplate.all
  end
end
