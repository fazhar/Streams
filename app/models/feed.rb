class Feed < ActiveRecord::Base
  	belongs_to :user, inverse_of: :feed
  	has_and_belongs_to_many :conversations
end
