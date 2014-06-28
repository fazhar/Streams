class Post < ActiveRecord::Base
  belongs_to :user, inverse_of: :posts
  belongs_to :conversation, inverse_of: :posts

  validates :title, presence: true, length: {minumum: 3, maximum: 50}
  validates :content, presence: true

end
