class AddAttachmentToScores < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :attachment, :string
  end
end
