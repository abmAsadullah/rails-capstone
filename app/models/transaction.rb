class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :connectors
  has_many :transactions, through: :connectors

  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: { only_integer: true }
  validates :user_id, presence: true
end
