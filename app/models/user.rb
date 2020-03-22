class User < ApplicationRecord
    validates :user, presence: true, uniqueness: { case_sensitive: false },
                length: {minimum: 3, maximum: 50}
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, 
               length: {maximum: 50}, format: { with: VALID_EMAIL_REGEX }
    has_many :articles
    before_save {self.email = email.downcase}
    has_secure_password
end