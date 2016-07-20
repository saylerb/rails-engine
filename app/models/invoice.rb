class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items

  validates :customer, presence: :true
  validates :merchant, presence: :true
  validates :status, presence: :true
  validates :created_at, presence: :true
  validates :updated_at, presence: :true

end
