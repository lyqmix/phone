class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :phone_id
      t.integer :cart_id

      t.timestamps null: false
    end
  end
end
