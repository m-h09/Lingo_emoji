class CreateMessageTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :message_templates do |t|
      t.integer :category
      t.integer :emoji
      t.integer :tone
      t.text :content

      t.timestamps
    end
  end
end
