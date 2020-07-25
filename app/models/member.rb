class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shippings, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  enum is_deleted: { 有効: true, 退会済み: false}
  validates :last_name, :first_name, :last_name_phonetic, :first_name_phonetic, :postcode, :address, :telephone_number, presence: true

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
	self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
