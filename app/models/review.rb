class Review < ActiveRecord::Base
    belongs_to :phone
    belongs_to :user
end
