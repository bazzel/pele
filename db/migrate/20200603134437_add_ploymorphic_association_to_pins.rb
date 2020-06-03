class AddPloymorphicAssociationToPins < ActiveRecord::Migration[6.0]
  def change
    Pin.destroy_all
    remove_column :pins, :song_id
    add_reference :pins, :pinnable, polymorphic: true, null: false
  end
end
