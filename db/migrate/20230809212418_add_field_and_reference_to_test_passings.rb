# frozen_string_literal: true

class AddFieldAndReferenceToTestPassings < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passings, :correct_questions_counter, :integer, default: 0, null: false
    add_reference :test_passings, :current_question, foreign_key: { to_table: :questions }, null: false
  end
end
