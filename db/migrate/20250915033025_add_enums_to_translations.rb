class AddEnumsToTranslations < ActiveRecord::Migration[8.0]
  def change
    add_column :translations, :mode, :integer
    add_column :translations, :tone, :integer
    add_column :translations, :strength, :integer
    add_column :translations, :radio_emoji, :integer
  end
end
