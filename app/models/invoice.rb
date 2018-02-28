class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :company
  has_many :invoice_products, dependent: :destroy
  has_many :products, through: :invoice_products
  accepts_nested_attributes_for :invoice_products, reject_if: lambda { |a| a[:product_id].blank? }, allow_destroy: :true
  validates :client, presence: true
  validates :status, presence: true
  validates :balance, presence: true
  validates :company, presence: true
end
