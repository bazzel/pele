class AddDiscardedAtToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :discarded_at, :datetime
    add_index :songs, :discarded_at
  end
end
