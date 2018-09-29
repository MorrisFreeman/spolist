class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable

  validates :name, presence: true, length: { maximum: 50 }

  def self.from_omniauth(auth)
  	user = User.where(email: auth.info.email).first
  	if user
  		user
  	else
			where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        p auth.info
        p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
		    # user.email = auth.info.email
        user.email = auth.info.email.nil? ? auth.provider + auth.uid + "@login.function" : auth.info.email
		    user.password = Devise.friendly_token[0,20]
		    user.name = auth.info.name
		    user.image = auth.info.image
		    user.uid = auth.uid
		    user.provider = auth.provider

		    # If you are using confirmable and the provider(s) you use validate emails,
		    # uncomment the line below to skip the confirmation emails.
		    user.skip_confirmation!
		  end
  	end
	end
end
