class CommentsController < ApplicationController
	before_action :require_user

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params)
		@comment.user = current_user
		if @comment.save
			flash[:success] = "Your comment has been posted"
			redirect_to post_path(@post)
		else
			flash[:danger] = "Comment was not created"
			redirect_back fallback_location: post_path(@post)
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:description)
	end
end