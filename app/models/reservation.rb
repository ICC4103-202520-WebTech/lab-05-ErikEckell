class Reservation < ApplicationRecord
  belongs_to :guest
  belongs_to :room
  has_many   :service_usages, dependent: :destroy
  has_one    :invoice, dependent: :destroy

  validates :code, presence: true, uniqueness: true
  validates :check_in, :check_out, :status, :adults, presence: true
  validates :adults, :children, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
