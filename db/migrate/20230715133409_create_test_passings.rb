class CreateTestPassings < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passings do |t|
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false
      t.string :passing_status, null: false

      t.timestamps
    end
  end
end
