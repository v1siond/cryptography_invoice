class Client < ActiveRecord::Base
  has_many :invoices, dependent: :destroy
  validates :name, presence: true
  validates :direction, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :identification, presence: true, uniqueness: true

  def self.search(term)
    where('LOWER(identification) LIKE :term OR LOWER(name) LIKE :term', term: "%#{term.downcase}%")
  end
end
