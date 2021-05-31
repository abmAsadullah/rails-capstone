class Group < ApplicationRecord
  belongs_to :user
  has_many :connectors
  has_many :transactions, through: :connectors

  has_one_attached :icon
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def icon_attachment_path
    icon.attached? ? icon : 'default.jpg'
  end
end
