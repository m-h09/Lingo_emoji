class MessageTemplate < ApplicationRecord
  enum :category, { daily: 0, reaction: 1, invitation: 2, sns: 3, check_question: 4 }
  enum :emoji, { add: 0, kansai: 1 }
  enum :tone, { formal: 0, casual: 1 }

  validates :category, :emoji, :tone, presence: true
  validates :content, presence: true
end
