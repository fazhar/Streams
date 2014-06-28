class User < ActiveRecord::Base
	has_many :conversations, inverse_of: :user, dependent: :destroy
	has_many :posts, inverse_of: :user, dependent: :destroy
	has_many :follows
	has_many :followed_conversations, class_name: "Conversation", through: :follows, dependent: :destroy, source: :conversation

	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, format: { with: VALID_EMAIL_REGEX }

	def self.from_omniauth(auth)
		find_by_provider_and_uid(auth["provider"], auth[:uid])
	end

	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
			user.image_source = auth["info"]["image"]
			if user.provider = "facebook"
				user.location = auth["info"]["location"]
				user.email = auth["info"]["email"]
			elsif user.provider == "twitter"
				user.location = auth["info"]["location"]
				user.about = auth["info"]["description"]
				user.email = "addyours@email.com"
			else
				user.email = auth["info"]["email"]
			end
		end
	end

end
