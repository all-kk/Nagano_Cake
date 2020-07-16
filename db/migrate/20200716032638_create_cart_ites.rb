class CreateCartItes < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_ites do |t|
      t.integer :product_id
      t.integer :member_id
      t.integer :number

      t.timestamps
    end
  end
end
