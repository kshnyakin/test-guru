class BadgeTemplate < ApplicationRecord
  has_many :badges, dependent: :destroy

  enum issuance_type: {
    all_tests_by_category: 'all_tests_by_category',
    all_tests_by_level: 'all_tests_by_level',
    test_by_attempts_number: 'test_by_attempts_number'
  }
end
