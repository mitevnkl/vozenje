class AddFbPicUrlToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :fb_pic_url, :string
  end
end
