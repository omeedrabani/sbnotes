class SearchController < ApplicationController

#got instructions for search from: http://www.sitepoint.com/full-text-search-rails-elasticsearch/

def search
	if params[:query].nil?
		@notes = []
	else
		@notes = Note.search params[:query]
	end	
end

end
