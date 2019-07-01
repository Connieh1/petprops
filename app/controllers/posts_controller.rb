class PostsController < ApplicationController
	before_action :set_recipe, only: [:show, :edit, :update]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = User.second
		@post.pet = User.second.pets[0]
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

		def set_recipe
			@post = Post.find_by(id: params[:id])
		end

end


