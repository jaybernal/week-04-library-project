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


################################### Library ##########################################
# Index = Displays the list of data
get "/library" do 
	@libraries = Library.all
	erb :library_index
end

# New = Create new Library Branches
get "/library/new" do 
	erb :library_new
end

# Create = Post new data submitted to activerecord
post "/library" do 
	if @library = Library.create(params)
		redirect to ("/library")
	else
		erb :library_new
	end
end

# Show = displays the
get "/library/:id" do 
	@library = Library.find_by_id(params["id"])
	erb :library_show
end

# edit = ablity to change existing records

get "/library/:id/edit" do 
	@library = Library.find_by_id(params["id"])
	erb :library_edit
end

post "/library/:id" do 
	@library = Library.find_by_id(params["id"])
	if @library.update_attributes(branch_name: params["branch_name"], phone_number: params["phone_number"], address: params["address"])
		redirect to ("/library/#{@library.id}")
	else
		erb :library_edit
	end
end


################################### Books ##########################################

# Index - Display all Books
get "/book" do 
	@books = Book.all
	erb :book_index
end



