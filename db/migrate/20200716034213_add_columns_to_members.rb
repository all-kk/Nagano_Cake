class AddColumnsToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :first_name, :stiring
    add_column :members, :last_name, :string
    add_column :members, :first_name_phonetic, :string
    add_column :members, :last_name_phonetic, :string
    add_column :members, :telephone_number, :string
    add_column :members, :postcode, :string
    add_column :members, :address, :string
    add_column :members, :is_deleted, :boolean
  end
end
