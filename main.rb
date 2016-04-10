require "pry"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

require_relative "lib/book.rb"
require_relative "lib/library.rb"
require_relative "lib/patron.rb"
require_relative "lib/staff_member.rb"


get '/pry' do
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

# Show = displays the data in an arrayfå
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

# New = Create new Library Branches
get "/book/new" do
	erb	:book_new
end

# Create = Post new data submitted to activerecord
post "/book" do
	binding.pry
	if @book = Book.create(params)
		redirect to ("/book")
	else
		erb :book_new
	end
end

# Show = displays the data in an array
get "/book/:id" do 
	@book = Book.find_by_id(params["id"])
	erb :book_show
end

# edit = ablity to change existing records

get "/book/:id/edit" do 
	@book = Book.find_by_id(params["id"])
	erb :book_edit
end

post "/book/:id" do 
	@book = Book.find_by_id(params["id"])
	if @book.update_attributes(title: params["title"], author: params["author"], isbn: params["isbn"])
		redirect to ("/book/#{@book.id}")
	else
		erb :book_edit
	end
end

################################### Staff Members ##########################################

# Index
get "/staff_members" do 
	@staff_members = StaffMember.all
	erb :staff_members_index
end

# New
get "/staff_members/new" do
	erb :staff_members_new
end

# Create
post "/staff_members" do 
	binding.pry
	if @staff_member = StaffMember.create(params)
		redirect to ("staff_members")
	else
		erb :staff_members_new
	end
end