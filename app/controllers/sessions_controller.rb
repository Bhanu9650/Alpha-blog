class SessionsController < ApplicationController

	def new
		
	end

	def create
		#render 'new'
		#debugger
		user = User.find_by(email: params[:sessions][:email].downcase)

		if user && user.authenticate(params[:sessions][:password])
			flash[:success] = "You have successfully logged in"
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			flash.now[:danger] = "There was something wrong in login information"
			render 'new'
		end
	end

	def delete
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path 
	end

end