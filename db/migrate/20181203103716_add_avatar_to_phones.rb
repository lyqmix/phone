class AddAvatarToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :avatar, :string
  end
end
