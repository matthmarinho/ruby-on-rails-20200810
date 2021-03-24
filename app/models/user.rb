class User < ApplicationRecord
    has_secure_password
    validates :name, :email, uniqueness: true
end
