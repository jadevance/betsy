class Order < ActiveRecord::Base
  validates :status, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  has_many :order_items
  has_many :products, through: :order_items
  belongs_to :user

end
