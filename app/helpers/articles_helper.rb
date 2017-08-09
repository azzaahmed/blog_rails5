module ArticlesHelper
	# get the comments that is saved in the database only and reject if one is being created
	def persisted_comments(comments)
comments.reject { |comment| comment.new_record? } 
end
end
