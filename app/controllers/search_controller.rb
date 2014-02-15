class SearchController < ApplicationController
	def search
		page_size = 10

		@post_search = Post.search do
			fulltext params[:q]
		end

		@posts = @post_search.results 

		@user_search = User.search do
			fulltext params[:q]
		end

		@users = @user_search.results
	end
end
