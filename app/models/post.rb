class Post < ApplicationRecord
    validates :title, presence: true, length: { maximum: 50 }
    validates :body, presence: true
    validates :user_id, presence: true
    belongs_to :user
end
