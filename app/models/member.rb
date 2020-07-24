class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shippings, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  enum is_deleted: { 有効: true, 退会済み: false}
  def active_for_authentication?
    super && self.is_deleted?
  end
end
