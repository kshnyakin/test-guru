class AddDurationToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :duration_min, :integer
  end
end
