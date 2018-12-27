class Order < ActiveRecord::Base
    PAYMENT_TYPES=["支付宝","微信","信用卡"]
    validates :name,:address,:email,:pay_type,presence: { message: "请输入！！！" }
    validates :pay_type,:inclusion=>PAYMENT_TYPES
    has_many :items,:dependent=>:destroy
    belongs_to :user
    
    def add_items_from_cart(cart) 
        cart.items.each do |item|
            item.cart_id=nil
            phone=Phone.find(item.phone_id)
            phone.number=0
            phone.save
            items<<item
        end
    end
end
