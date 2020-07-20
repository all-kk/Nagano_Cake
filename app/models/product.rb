class Product < ApplicationRecord
	attachment :image
	belongs_to :genre
	has_many :order_details
	belongs_to :cart_item
	has_many :order_details, dependent: :destroy
	enum is_capable: { 販売中: true, 販売停止中: false}
	validates :price, presence: true
end
