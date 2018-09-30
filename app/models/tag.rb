class Tag < ApplicationRecord
  belongs_to :playlist, optional: true

  validates :content, presence: true
end
