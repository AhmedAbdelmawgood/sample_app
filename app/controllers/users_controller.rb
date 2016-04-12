class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
  	@user = User.new(user_params)
  	if @user.save 
  		flash[:success] = "Weclome At Sample App"
  		redirect_to @user
  	else
  		render :new 
  	end
  end
  def show 
  	@user = User.find(params[:id])
  	# debugger
  end
  private 
  def user_params
  	params.require(:user).permit(:name, :password, :email, 
  								:email_confirmation, :password_confirmation)
  end
end
