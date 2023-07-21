# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :test_passings, dependent: :destroy
  has_many :users, through: :test_passings

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validate :validate_title_level_uniqueness, on: %i[create update]

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  # не стал переписывать на scope т.к. метод возвращает массив,
  # а scope должен возвращать ActiveRcord::Relation
  def self.list_by_category(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end

  def validate_title_level_uniqueness
    errors.add(:base) if Test.find_by(title: title, level: level)
  end
end
