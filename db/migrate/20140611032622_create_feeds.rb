class CreateFeeds < ActiveRecord::Migration
  def change
  	drop_table :feeds

    create_table :feeds do |t|
      	t.references :user, index: true
      	t.references :conversations, index: true

      	t.timestamps
    end
  end
end
