class Translation < ApplicationRecord
  enum :emoji, { add: 0, kansai: 1, emoji_kansai: 2 }
  enum :tone, { formal: 0, casual: 1, frank: 2 }
  enum :strength, { weak: 0, medium: 1, strong: 2 }
  enum :radio_emoji, { no_kaomoji: 0, no_icon: 1, nothing: 2 }

  belongs_to :user
  has_many :histories, dependent: :destroy
end
