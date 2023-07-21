# frozen_string_literal: true

class AddTitleLevelIndexToTests < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_index :tests, %i[title level], unique: true
  end
end
