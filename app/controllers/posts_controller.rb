class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def index
		@posts = Post.paginate(page: params[:page], per_page: 5)
	end

	def new
		if params[:pet_id]
			@pet = Pet.find(params[:pet_id])    
    	@post = @pet.posts.build
    	@post.user = current_user	
    else
    	@post = Post.new
    	@post[:pet_id] = @pet.id
    	@post.user = current_user
		end
	end

	def create


		@post = Post.new(post_params)
		# if params[pet_id]
	  @post.pet = Pet.find(params[:post][:pet_id])   
  # 	@post = @pet.posts.build(post_params)
  	@post.user = current_user  
  	if @post.save
    	flash[:notice] = "Successfully created post."
    	# redirect_to pet_posts_path(@post.pet)
    	redirect_to user_pet_path(current_user.id, @post.pet.id)
  	else
   	 render :action => 'new'
  	end
	end

	def show
		@comment = Comment.new
		@comments = @post.comments.paginate(page: params[:page], per_page: 10)
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:success] = "Post was updated successfully!"
			redirect_to post_path
		else
			render 'edit'
		end
	end

	def destroy
		Post.find_by(id: params[:id]).destroy
		flash[:success] = "Post deleted successfully!"
		redirect_to posts_path
	end

	private

		def post_params
			params.require(:post).permit(:title, :content, :user_id, :pet_id)
		end

		def set_post
			@post = Post.find_by(id: params[:id])
		end

		def require_same_user
			if current_user != @post.user && !current_user.admin?
				flash[:danger] = "You can only edit or delete your own posts"
				redirect_to posts_path
			end
		end
end


