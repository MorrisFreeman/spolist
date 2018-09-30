class Playlist < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags

  validates :content, presence: true
end
