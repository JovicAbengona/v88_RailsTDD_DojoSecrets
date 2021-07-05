class UsersController < ApplicationController
  def new
  end

  def register
    user = User.new(user_params)
    if user.save
      redirect_to "/sessions/new"
    else
      flash[:errors] = user.errors.messages
      redirect_to '/users/new'
    end
  end

  def show
    if current_user
      @user = User.find(params[:id])
    else
      redirect_to "/"
    end
  end

  def edit
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
