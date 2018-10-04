class Playlist < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user, dependent: :destroy

  validates :content, presence: true
end
