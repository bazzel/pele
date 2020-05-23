class Score < ApplicationRecord
  belongs_to :song

  mount_uploader :attachment, AttachmentUploader
end
