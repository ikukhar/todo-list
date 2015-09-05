class AddUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    remove_column :users, :url
  end
end
