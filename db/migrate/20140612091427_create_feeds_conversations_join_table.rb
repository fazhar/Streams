class CreateFeedsConversationsJoinTable < ActiveRecord::Migration
  def change
  	drop_table :conversations_feed
  	create_join_table :conversations, :feeds
  end
end
