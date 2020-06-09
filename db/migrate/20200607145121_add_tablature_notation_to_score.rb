class AddTablatureNotationToScore < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :tablature_notation, :boolean
    add_column :scores, :standard_notation, :boolean
    add_column :scores, :chord_notation, :boolean
  end
end
