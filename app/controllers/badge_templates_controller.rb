class BadgeTemplatesController < ApplicationController
  def index
    @template_badges = BadgeTemplate.all
  end
end
