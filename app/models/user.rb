class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('INNER JOIN test_passings ON tests.id = test_passings.test_id')
        .where(level: level, test_passings: { user_id: id })
  end
end
