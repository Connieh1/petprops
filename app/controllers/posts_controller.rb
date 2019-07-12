class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def index
		@posts = Post.paginate(page: params[:page], per_page: 5)
	end

	def new
		@post = Post.new
		@post.user = current_user
		@pets = @post.user.pets
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.save
			flash[:success] = "Post was created successfully!"
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:sucess] = "Post was updated successfully!"
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
			if current_user != @post.user
				flash[:danger] = "You can only edit or delete your own posts"
				redirect_to posts_path
			end
		end
end


