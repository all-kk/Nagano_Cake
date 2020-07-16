class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.integer :member_id
      t.string :name
      t.string :postcode
      t.string :address

      t.timestamps
    end
  end
end
