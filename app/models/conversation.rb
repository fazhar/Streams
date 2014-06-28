class Conversation < ActiveRecord::Base
  belongs_to :user, inverse_of: :conversations
  has_many :follows
  has_many :followers, through: :follows, dependent: :destroy, source: :user
  has_many :posts, inverse_of: :conversation, dependent: :destroy

  validates :title, presence: true, length: {minimum:3, maximum:50}
  validates :description, presence: true 
end
