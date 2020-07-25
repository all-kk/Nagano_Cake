class Shipping < ApplicationRecord
	belongs_to :member
	validates :name, :postcode, :address, presence: true
	def full_member_address
		self.postcode + self.address + self.name
	end

	include JpPrefecture
    jp_prefecture :prefecture_code

    def prefecture_name
       JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
    end

    def prefecture_name=(prefecture_name)
	   self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
    end
end
