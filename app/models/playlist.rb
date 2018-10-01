class Playlist < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user

  validates :content, presence: true
end
