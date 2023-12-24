class DeleteBadgeTemplateModel < ActiveRecord::Migration[6.0]
  def change
    remove_column :badges, :badge_template_id
    add_column :badges, :award_type, :string, null: false
    add_column :badges, :award_condition, :string, null: false
    add_column :badges, :img_path, :string, null: false
    drop_table :badge_templates
    create_table :issued_awards do |t|
      t.references :user, foreign_key: true, null: false
      t.references :badge, foreign_key: true, null: false
      t.timestamps
    end
  end
end
