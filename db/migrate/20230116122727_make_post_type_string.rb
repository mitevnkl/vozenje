class MakePostTypeString < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :post_type, :string
  end
end
