class Order < ApplicationRecord
<<<<<<< HEAD
	has_many :order_details, dependent: :destroy
	belongs_to :member
	enum payment_method: { クレジットカード:1, 銀行振り込み:2 }
=======
>>>>>>> 3750082e7990cb29a2a445afa6a03d7435b093c6
end
