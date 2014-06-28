class CreateConversations < ActiveRecord::Migration
    def change
        
        create_table :conversations do |t|
            t.string :title
            t.text :description
            t.references :user, index: true
            t.references :follows, index: true
            t.references :posts, index: true

            t.timestamps
        end
    end
end
