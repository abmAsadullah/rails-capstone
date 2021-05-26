class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: { only_integer: true }
  validates :user_id, presence: true
end
