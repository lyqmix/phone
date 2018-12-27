class Item < ActiveRecord::Base
    belongs_to :phone
    belongs_to :cart
    belongs_to :order
end
