class AddNameToBadge < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :name, :string, null: false
    remove_index 'badges', column: [:user_id], name: 'index_badges_on_user_id'
    remove_column :badges, :user_id
  end
end
