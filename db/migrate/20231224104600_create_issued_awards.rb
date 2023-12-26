class CreateIssuedAwards < ActiveRecord::Migration[6.0]
  def change
    create_table :issued_awards do |t|
      t.references :user, foreign_key: true, null: false
      t.references :badge, foreign_key: true, null: false

      t.timestamps
    end
  end
end
