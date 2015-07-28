class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :cat_type
      t.string :cat_quantity
      t.string :cat_name

      t.timestamps null: false
    end
  end
end
