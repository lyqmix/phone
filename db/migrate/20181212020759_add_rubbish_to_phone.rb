class AddRubbishToPhone < ActiveRecord::Migration
  def change
    add_column :phones, :rubbish, :integer,:default=>0
  end
end
