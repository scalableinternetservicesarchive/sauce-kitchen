class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if (@user.save)
      login(@user)
  		redirect_to @user
      flash[:success] = "You've successfully signed up!"
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
	end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes(avatar: params[:avatar])
  #     flash[:notice] = 'Upload was successfully updated'
  #     redirect_to @user
  #   else
  #     redirect_to @user
  #   end
  # end

  private
  	def user_params
  		params.require(:user).permit(:email, :username, :password, :password_confirmation, :avatar)
  	end
end
