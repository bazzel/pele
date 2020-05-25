class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name, limit: 100
      t.datetime :discarded_at
      t.index :discarded_at

      t.timestamps
    end
  end
end
