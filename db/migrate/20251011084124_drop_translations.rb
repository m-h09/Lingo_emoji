class DropTranslations < ActiveRecord::Migration[8.0]
  def change
    drop_table :translations do |t|
      t.integer :emoji
      t.integer :tone
      t.integer :strength
      t.integer :radio_emoji
    end
  end
end
