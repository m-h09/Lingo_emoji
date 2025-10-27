class CreateMessageTemplates < ActiveRecord::Migration[7.2]
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
