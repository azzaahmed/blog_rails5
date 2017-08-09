class Article < ApplicationRecord
	validates :title, presence: true 
	validates :body, presence: true

	
	default_scope { order(created_at: :desc) }

	belongs_to :user 
# dependent so if article is deleted its comments is deleted as well
	has_many :comments, dependent: :destroy 
end
