class Genre < ApplicationRecord
	has_many :products
	enum is_enabled: { 有効: true, 無効: false}
	has_many :products, dependent: :destroy
	validates :name, presence: true
end
