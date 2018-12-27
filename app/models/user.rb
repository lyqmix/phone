class User < ActiveRecord::Base
    validates :name, presence: { message: "用户名不能为空" }
    validates :password, presence: { message: "密码不能为空" }
    validates :name, uniqueness: { message: "用户名已存在" }
    validates :password, length: { minimum: 6, message: "密码长度最短为6位" }
    validate :is_phone_right
    validate :is_email_right
    
    mount_uploader :avatar, AvatarUploader
    has_many :phones
    has_many :orders
    has_many :reviews
    private
    def is_phone_right
        unless self.phone=~/^1(3|4|5|7|8)\d{9}$/
            errors.add(:phone,"电话号码不正确")
        end
    end
    private
    def is_email_right
        unless self.email=~/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/
            errors.add(:email,"邮箱格式不正确")
        end
    end
end
