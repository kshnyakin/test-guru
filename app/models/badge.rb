class Badge < ApplicationRecord
  has_many :issued_awards
  has_many :users, through: :issued_awards

  enum award_type: {
    all_tests_by_level: 'all_tests_by_level',
    test_by_attempts_number: 'test_by_attempts_number',
    all_tests_by_category_id: 'all_tests_by_category_id'
  }
end
