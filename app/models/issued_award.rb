# frozen_string_literal: true

class IssuedAward < ApplicationRecord
  belongs_to :user
  belongs_to :badge
end
