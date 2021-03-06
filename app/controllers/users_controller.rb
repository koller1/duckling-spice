class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update, :index]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: :destroy

  def new
	  @user = User.new
  end

  def create
	  @user = User.new(user_params)
	  if @user.save
		flash[:success] = "Profile created successfully"
		sign_in @user
		redirect_to(@user)	
	  else
	  	render :new	
	  end
  end

  def feed
    @user = User.find(params[:id])
    @posts = Post.all.order('created_at DESC')
  end

  def show
			@user = User.find(params[:id])
  end

  def edit #@user defined in before_action correct_user for edit and update
  end

  def update
		@user.assign_attributes(user_params)
		if @user.save
			flash[:success] = "Profile Successfully Updated"
			render :show
		else
			render :edit
		end	
  end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			flash[:success] = "User deleted"
			redirect_to users_url 
		else
			flash.now[:warning] = "Unable to delete user"
			render 'show'
		end
	end

	def index
		@users = User.paginate(page: params[:page])
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password,
											  :password_confirmation)
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to root_url unless current_user?(@user)
	end

	def admin_user
		redirect_to root_url unless current_user.admin?
	end

end
