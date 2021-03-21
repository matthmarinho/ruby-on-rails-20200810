class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :type
      t.string :description
      t.string :filename
      t.float :height
      t.float :width
      t.float :price
      t.integer :rating

      t.timestamps
    end
  end
end
