class Order < ApplicationRecord
	has_many :order_details, dependent: :destroy
	belongs_to :member
	enum payment_method: { クレジットカード:0, 銀行振り込み:1 }
end
