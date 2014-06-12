class Conversation < ActiveRecord::Base
  belongs_to :user, inverse_of: :conversations
  has_and_belongs_to_many :feeds
  has_many :posts, inverse_of: :conversation
end
