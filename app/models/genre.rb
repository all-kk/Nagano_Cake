class Genre < ApplicationRecord
<<<<<<< HEAD
	has_many :products
	enum is_enabled: { 有効: true, 無効: false}
=======
	has_many :products, dependent: :destroy
>>>>>>> origin/develop
end
