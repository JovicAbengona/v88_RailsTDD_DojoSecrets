class UsersController < ApplicationController
  def new
  end

  def register
    user = User.create(user_params)
    render plain: user.errors.full_messages
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
      params.require(:user).permit(:name, :email, :password)
    end
end
