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
  	if !(@user = User.find_by(id: params[:id]))
      flash[:warning] = "User #{params[:id]} doesn't exist... check your facts yo"
      redirect_to root_url
    end
	end

  private
  	def user_params
  		params.require(:user).permit(:email, :username, :password, :password_confirmation)
  	end
end
