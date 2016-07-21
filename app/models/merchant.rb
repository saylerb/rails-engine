class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  validates :name, presence: :true
  validates :created_at, presence: :true
  validates :updated_at, presence: :true

  def customers_with_pending_invoices
    Customer.find(invoices.pending.distinct.pluck(:customer_id))
  end

  def total_revenue
    result = invoices.
             joins(:transactions, :invoice_items).
             where("transactions.result = 'success'").
             sum("invoice_items.quantity * invoice_items.unit_price") 

    { revenue: (result/100.0).to_s }
  end
  
  def revenue_for_day(date)
    result = invoices.
             joins(:transactions, :invoice_items).
             where(transactions: { result: 'success' }, invoices: { created_at: date }).      
             sum("invoice_items.quantity * invoice_items.unit_price") 

    { revenue: (result/100.0).to_s }
  end

  def self.top_merchants_by_items(quantity)
    joins(invoices: [:transactions, :invoice_items]).
    where("transactions.result = 'success'").
    group(:id).
    order("sum(invoice_items.quantity) DESC").
    limit(quantity)
  end

  def self.top_merchants_by_revenue(quantity)
    joins(:invoice_items).
    group(:id).
    order("sum(invoice_items.quantity * invoice_items.unit_price) DESC").
    limit(quantity)
  end

  def favorite_customer
    customers.
    joins(:transactions).
    where(transactions: { result: 'success' } ).
    group(:id).
    order('count(invoices.merchant_id) DESC').
    limit(1).take
  end
end

