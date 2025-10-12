class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :cryped_password, presence: true, length: { minimum: 6 }
  validates :salt, presence: true

  has_many :histories, dependent: :destroy
  has_many :translations, dependent: :destroy
end
