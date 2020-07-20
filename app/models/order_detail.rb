class OrderDetail < ApplicationRecord
	belongs_to :prduct
	belongs_to :order
end
