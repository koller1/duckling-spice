class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
		#	redirect_back_or(user) 
		  redirect_to :controller => 'users', :action => 'feed', :id => current_user.id
		else
			flash.now[:danger] = "Invalid username/password"
			render 'new'
		end
	#	@user = User.new(params[:session])
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end
