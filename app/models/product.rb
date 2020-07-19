class Product < ApplicationRecord
	belongs_to :genre
	has_many :order_details
	enum is_capable: { 販売中: true, 販売停止中: false}
end
