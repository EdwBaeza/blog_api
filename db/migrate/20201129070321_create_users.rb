class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :last_name
      t.string :second_last_name, null: true
      t.string :auth_token, null: true
      t.integer :posts_count, null: true
      t.boolean :is_premium, default: false
      t.timestamps
    end
  end
end
