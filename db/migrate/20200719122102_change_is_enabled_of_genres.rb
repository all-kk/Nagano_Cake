class ChangeIsEnabledOfGenres < ActiveRecord::Migration[5.2]
  	def up
  	  change_column :genres, :is_enabled, :boolean, default: true
  	end
  	def down
  	  change_column :genres, :is_enabled, :boolean
    end
end
