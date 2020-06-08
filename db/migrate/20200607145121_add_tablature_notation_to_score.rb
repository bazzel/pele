class AddTablatureNotationToScore < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :tablature_notation, :boolean
  end
end
