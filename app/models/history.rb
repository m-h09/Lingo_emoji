class History < ApplicationRecord
  validates :record, presence: true
  belongs_to :user
  belongs_to :translation, optional: true
  paginates_per 20
end
