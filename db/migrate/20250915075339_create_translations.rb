class CreateTranslations < ActiveRecord::Migration[7.2]
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
