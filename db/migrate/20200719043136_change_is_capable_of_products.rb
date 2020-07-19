class ChangeIsCapableOfProducts < ActiveRecord::Migration[5.2]
  def up
  	  change_column :products, :is_capable, :boolean, default: true
  end
  def down
  	change_column :products, :is_capable, :boolean
  end
end
