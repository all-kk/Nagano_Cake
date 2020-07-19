class Product < ApplicationRecord
	belongs_to :genre
	belongs_to :cart_item
	has_many :order_details, dependent: :destroy
	enum is_capable: { 販売中: true, 販売停止中: false}
end
