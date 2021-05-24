class CreateBlogTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_types do |t|
      t.integer :blog_id
      t.integer :blog_category_id
      t.timestamps
    end
  end
end
