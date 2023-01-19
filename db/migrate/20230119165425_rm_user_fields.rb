class RmUserFields < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :facebook_picture_url
    remove_column :users, :token
    remove_column :users, :token_expiry
  end
end
