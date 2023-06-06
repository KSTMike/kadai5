class Post < ApplicationRecord
    self.abstract_class = true
    validates :content, presence: true
    validates :user_name, uniqeness: true
    validates :content, length: {minimum: 1 }
    validates :content, length: {maximum: 140}
end
