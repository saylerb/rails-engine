class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item

  validates :invoice, presence: :true
  validates :item, presence: :true
  validates :quantity, presence: :true
  validates :unit_price, presence: :true
  validates :created_at, presence: :true
  validates :updated_at, presence: :true
end
