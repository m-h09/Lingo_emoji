class ChangeTranslationIdNullableOnHistories < ActiveRecord::Migration[7.2]
  def change
    unless column_exists?(:histories, :translation_id)
      add_reference :histories, :translation, null: true, foreign_key: true
    end
  end
end
