class User < ApplicationRecord
  attr_accessor :current_password
  has_many :playlists, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_playlists, through: :favorites, source: :playlist, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         # :confirmable,
         :omniauthable

  validates :name, presence: true, length: { maximum: 50 }

  def add_favorite(playlist)
    favorite_playlists << playlist
  end

  def delete_favorite(playlist)
    favorites.find_by(playlist_id: playlist.id).destroy
  end

  def favorite?(playlist)
    favorite_playlists.include?(playlist)
  end

  def self.from_omniauth(auth)
  	user = User.where(email: auth.info.email).first
  	if user
      user
  	else
			where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email.nil? ? auth.provider + auth.uid + "@login.function" : auth.info.email
		    user.password = Devise.friendly_token[0,20]
		    user.name = auth.info.name
		    user.image = auth.info.image
		    user.uid = auth.uid
		    user.provider = auth.provider

		    # If you are using confirmable and the provider(s) you use validate emails,
		    # uncomment the line below to skip the confirmation emails.
		    # user.skip_confirmation!
		  end
  	end
	end
end
