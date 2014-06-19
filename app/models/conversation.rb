class Conversation < ActiveRecord::Base
  belongs_to :user, inverse_of: :conversations
  has_many :followings
  has_many :followers, through: :follows, dependent: :destroy
  has_many :posts, inverse_of: :conversation, dependent: :destroy

  validates :title, presence: true, length: {minimum:5}
  validates :description, presence: true 
end
