class CreateBadgeTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :badge_templates do |t|
      t.references :category, foreign_key: true
      t.string :title
      t.string :img_path
      t.integer :level
      t.integer :attempts_number
      t.string :issuance_type, null: false

      t.timestamps
    end
  end
end
