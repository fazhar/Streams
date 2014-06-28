class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :about, :text
    add_column :users, :location, :string
    add_column :users, :email, :string
    add_column :users, :image_source, :string
  end
end
