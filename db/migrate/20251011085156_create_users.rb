class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name, null: false # 空の状態を防ぐ
      t.string :email, null: false, index: { unique: true } # index:{uniqe: true}で同じemail登録を防ぐ
      t.string :crypted_password, null: false
      t.string :salt
      t.timestamps
    end
  end
end
