class Post < ApplicationRecord
    belongs_to :user
    
    # validates :title, presence: true
    # validates :content, presence: true
    # validates :content, length: {
    #   minimum: 2
    # }
    # validates :content, length: {
    #   minimum: 2
    # }

   
end
