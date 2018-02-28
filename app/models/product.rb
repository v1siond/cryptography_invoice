class Product < ActiveRecord::Base
  has_many :invoice_products
  has_many :invoices, through: :invoice_products
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true

  def self.search(term)
    where('CAST(id AS text) LIKE :term OR LOWER(name) LIKE :term', term: "%#{term.downcase}%")
  end
end
