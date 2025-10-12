class CreateHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :histories do |t|
      t.references :user, null: false, foreign_key: true
      # t.references :translation, null: false, foreign_key: true
      t.string :record
      t.timestamps
    end
  end
end
