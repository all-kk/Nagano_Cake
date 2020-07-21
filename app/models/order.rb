class Order < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
	has_many :order_details, dependent: :destroy
	belongs_to :member
	enum payment_method: { クレジットカード:1, 銀行振り込み:2 }
=======
>>>>>>> 3750082e7990cb29a2a445afa6a03d7435b093c6
=======
	has_many :order_details, dependent: :destroy
	belongs_to :member
	enum payment_method: { クレジットカード:0, 銀行振り込み:1}
	enum status: { 入金待ち: 0, 入金確認: 1, 制作中: 2, 発送準備中:3, 発送済み: 4}
>>>>>>> 50ce59b2cadfcb2149ff640e1f0d0e6b2d68eb34
end
