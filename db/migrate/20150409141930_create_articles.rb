class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content1
      t.text :content2
      t.text :content3
      t.text :content4

      t.timestamps null: false
    end
  end
end
