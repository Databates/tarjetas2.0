List all post (index action) 

get "/posts" do 
	@posts = Post.all 
	erb 'posts/index'#render up index page to show all posts

#load resouce from server
get "/posts/:id" do  # put id in url
	@post = Post.find(params[:id])  #rack how sinatra rspond. by define a route with this syntax , whatever after post/ will be value of params [:id]
	#taking something out of URL and inject in params hash and look up value in params hash
	creates link like: /posts/3

	erb  "posts/show"
end


#show form to create a new post 
get "/posts/new" do 
	erb "posts/new"
end


Create a new post:(create): 

post "/posts" do #same url to get a list of posts or all of posts. FINE because verb different
	#get, go to URL, post a new instance of resource to the ocllection. 
	#url represents collection but posting to it
	@post = Post.new(params)
	if @post.save
			redirect to("/posts/#{@post.id}")
	else
		#if can't save post - show new form again. 
		#best thing, prepopulate with what they submitted so they can fix what not pass validation
		erb "posts/new"
	end
end
#same show page go to view any post



