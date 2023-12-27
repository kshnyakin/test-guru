class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :award_type, null: false
      t.string :award_condition, null: false
      t.string :img_path, null: false

      t.timestamps
    end
  end
end
