# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/tests_mailer
class TestsMailerPreview < ActionMailer::Preview
  # Preview all emails at http://localhost:3000/rails/mailers/tests_mailer/completed_test
  def completed_test
    test_passing = TestPassing.new(user: User.first, test: Test.first)
    TestsMailer.completed_test(test_passing)
  end
end
