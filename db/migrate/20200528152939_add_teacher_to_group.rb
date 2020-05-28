class AddTeacherToGroup < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups,
                  :teacher,
                  null: false, foreign_key: { to_table: :users }
  end
end
