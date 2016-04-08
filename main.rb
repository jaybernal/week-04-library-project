require "pry"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

require_relative "lib/book.rb"
require_relative "lib/library.rb"
require_relative "lib/patron.rb"
require_relative "lib/staff_member.rb"


get "/" do 
	binding.pry
end

# Index = Displays the list of data
get "/library" do 
	@library = Library.all
	erb :library_index
end

# New = Create new Library Branches
get "/library/new" do 
	erb :library_new
end

# Create = Post new data submitted to activerecord
 
post "/library" do 
	binding.pry
end


# Show = displays the
get "/library/:id" do 
	@library = Library.find_by_id(params['id'])
	erb :library_show
end

