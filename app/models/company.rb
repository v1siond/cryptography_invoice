class Company < ActiveRecord::Base
  belongs_to :user
  has_many :invoices, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :nit, presence: true, uniqueness: true
  validates :direction, presence: true
  validates :city, presence: true
  validates :country, presence: true
end