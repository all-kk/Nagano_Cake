class ChangeIsDeletedDefaultOnMembers < ActiveRecord::Migration[5.2]
  def up
    change_column :members, :is_deleted,:boolean, default: true
  end

  def down
    change_column :members, :is_deleted, :boolean
  end
end
