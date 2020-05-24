class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :role, default: 2
      t.datetime :discarded_at
      t.index :discarded_at

      t.timestamps
    end
  end
end
