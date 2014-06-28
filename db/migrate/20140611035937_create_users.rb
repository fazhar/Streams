class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.references :follows, index: true
      t.references :conversations, index: true
      t.references :posts, index: true

      t.timestamps
    end
  end
end
