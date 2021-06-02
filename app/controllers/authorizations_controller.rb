class AuthorizationsController < ApplicationController

	def create
		@user = User.find_or_create_by(uid: auth['uid']) do |u|
			u.name = auth['info']['name']
			u.email = auth['info']['email']
			u.password = SecureRandom.hex(10)
		end

		session[:user_id] = @user.id

		flash[:success] = "You have successfully logged in"
	  redirect_to @user
	end

	def welcome
	end

private
	
	def auth
		request.env['omniauth.auth']
	end



end

