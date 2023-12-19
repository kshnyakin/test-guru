class AddSuccessfullToTestPassing < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passings, :successful, :boolean, default: false
  end
end
