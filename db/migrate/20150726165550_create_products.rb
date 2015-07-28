class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :pro_name
      t.float :pro_price
      t.string :pro_color

      t.timestamps null: false
    end
  end
end
