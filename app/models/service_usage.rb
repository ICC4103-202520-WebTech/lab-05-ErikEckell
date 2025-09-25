class ServiceUsage < ApplicationRecord
  belongs_to :reservation
  belongs_to :service

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
