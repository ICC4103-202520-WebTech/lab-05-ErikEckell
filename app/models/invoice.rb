class Invoice < ApplicationRecord
  belongs_to :reservation

  validates :nights_subtotal, :services_subtotal, :tax, :total, presence: true
  validates :nights_subtotal, :services_subtotal, :tax, :total, numericality: { greater_than_or_equal_to: 0 }
end
