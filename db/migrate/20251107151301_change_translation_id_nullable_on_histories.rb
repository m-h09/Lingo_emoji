class ChangeTranslationIdNullableOnHistories < ActiveRecord::Migration[7.2]
  def change
    change_column_null :histories, :translation_id, true
  end
end
