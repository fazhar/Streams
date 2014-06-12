class CreatePosts < ActiveRecord::Migration
    def change

    	drop_table :posts

        create_table :posts do |t|
            t.string :title
            t.text :content
            t.references :user, index: true
            t.references :conversation, index: true

            t.timestamps
        end
    end
end
