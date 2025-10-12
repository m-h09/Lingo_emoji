class MetaTagsList < ApplicationRecord
  belongs_to :meta_taggable, polymorphic: true, optional: true
end
