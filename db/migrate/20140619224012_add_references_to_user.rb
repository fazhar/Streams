class AddReferencesToUser < ActiveRecord::Migration
  def change
    add_reference :users, :follows, index: true
    add_reference :conversations, :follows, index: true
  end
end
