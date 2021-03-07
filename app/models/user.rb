class User < ApplicationRecord
    has_secure_password
    
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    with_options numericality: true do
        validates :body_mass, allow_nil: true
        validates :body_fat_percentage, allow_nil: true
        validates :tall, allow_nil: true
        validates :age, allow_nil: true
    end

    has_many :cooks

end
