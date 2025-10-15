class AddUserIdToTranslationsV2 < ActiveRecord::Migration[8.0]
  def change
    add_reference :translations, :user, null: false, foreign_key: true
  end
end
