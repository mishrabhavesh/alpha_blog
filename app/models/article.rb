class Article < ApplicationRecord
belongs_to :user
validates :title , presence: true , length: { minimum: 5 , maximum: 50 }
validates_presence_of :description
validates :description , length: { minimum: 10 , maximum: 1000 }
validates :user_id, presence: true
end