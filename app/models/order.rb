class Order < ApplicationRecord
	has_many :order_details, dependent: :destroy
	belongs_to :member
	enum payment_method: { クレジットカード:1, 銀行振り込み:2 }
end
