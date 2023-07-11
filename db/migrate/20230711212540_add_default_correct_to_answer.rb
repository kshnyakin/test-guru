class AddDefaultCorrectToAnswer < ActiveRecord::Migration[6.0]
  def change
    change_column :answers, :correct, :boolean, default: false
  end
end
