class AddActsAsTaggableOnCachedColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :cached_tag_list, :string, limit: 1024

    Song.all.each do |song|
      song.tag_list
      song.save!
    end
  end
end
