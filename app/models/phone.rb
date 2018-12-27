class Phone < ActiveRecord::Base
    validates :name, presence: { message: "手机名不能为空" }
    validates :brand, presence: { message: "手机品牌名不能为空" }
    validates :intro, presence: { message: "描述信息不能为空" }
    validates :avatar, presence: { message: "图片信息不能为空" }
    validates :price, numericality:{greater_than_or_equal_to:0.01,message:"价格应为大于0.01的数字"}
    mount_uploader :avatar, AvatarUploader
    belongs_to :user
    has_many :items,:dependent=>:destroy
    has_one :review
    
    before_destroy :ensure_not_items
    PHONE_TYPES=['小米','华为','荣耀','vivo','oppo','魅族','一加','锤子','HTC','联想','APPLE','三星','黑鲨','其他']
    PHONE_PRICES=['0-999','1000-1999','2000-2999','3000-3999','4000-4999','5000-6999','7000-']
    
    private
    def ensure_not_items
        if items.empty?
            return true
        else
            errors.add(:phone,"购物车存在该手机")
            return false
        end
    end
        
end
