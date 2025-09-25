class Guest < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :first_name, :last_name, :email, :phone, :document_id, presence: true
  validates :email, uniqueness: true
end
