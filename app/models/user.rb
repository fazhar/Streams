class User < ActiveRecord::Base
	has_many :conversations, inverse_of: :user, dependent: :destroy
	has_many :posts, inverse_of: :user, dependent: :destroy
	has_many :follows
	has_many :followed_conversations, class_name: "Conversation", through: :follows, dependent: :destroy, source: "User"

	def self.from_omniauth(auth)
		find_by_provider_and_uid(auth["provider"], auth[:uid]) || create_with_omniauth(auth)
	end

	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
		end
	end

end
