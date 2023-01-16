class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :post_type
      t.datetime :start_time
      t.datetime :end_time
      t.integer :spaces
      t.string :from_city
      t.string :to_city

      t.timestamps
    end
  end
end
