class AddOutputTextToTranslations < ActiveRecord::Migration[7.2]
  def change
    add_column :translations, :output_text, :text
  end
end
