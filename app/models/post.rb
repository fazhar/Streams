class Post < ActiveRecord::Base
  belongs_to :user, inverse_of: :posts
  belongs_to :conversation, inverse_of: :posts
end
