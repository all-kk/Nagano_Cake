class Shipping < ApplicationRecord
	belongs_to :member
	def full_member_address
		self.postcode + self.address + self.name
	end
end
