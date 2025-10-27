class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  authenticates_with_sorcery!

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :reset_password_token, uniqueness: true, allow_nil: true

  has_many :histories, dependent: :destroy
  has_many :translations, dependent: :destroy
end
