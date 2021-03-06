class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  validates :customer, presence: :true
  validates :merchant, presence: :true
  validates :status, presence: :true
  validates :created_at, presence: :true
  validates :updated_at, presence: :true

  scope :pending, -> { joins(:transactions).where(transactions: { result: 'failed' }) }
end
