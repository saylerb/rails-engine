class Transaction < ApplicationRecord
  belongs_to :invoice

  validates :invoice, presence: :true
  validates :credit_card_number, presence: :true
  validates :result, presence: :true
  validates :created_at, presence: :true
  validates :updated_at, presence: :true
end
