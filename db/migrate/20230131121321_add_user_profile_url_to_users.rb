class AddUserProfileUrlToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profile_link, :string
  end
end
