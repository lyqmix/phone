class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :name
      t.string :brand
      t.string :intro
      t.decimal :price,:precision=>8,:scale=>2
      t.integer :user_id
      t.integer :number,:default=>1
    

      t.timestamps null: false
    end
  end
end
