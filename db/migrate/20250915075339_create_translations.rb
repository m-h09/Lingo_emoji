class CreateTranslations < ActiveRecord::Migration[8.0]
  def change
    create_table :translations do |t|
      t.integer :emoji
      t.integer :tone
      t.integer :strength
      t.integer :radio_emoji

      t.timestamps
    end
  end
end
