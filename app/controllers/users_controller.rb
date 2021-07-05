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
      @secrets = User.find(session[:user_id]).secrets
      @secrets_liked = User.find(session[:user_id]).secrets_liked
    else
      redirect_to "/"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_update_params)
      redirect_to "/users/#{params[:id]}"
    else
      flash[:errors] = user.errors.messages
      redirect_to "/users/#{params[:id]}/edit"
    end
  end

  def delete
    user = User.find(params[:id])
    if user.destroy
      reset_session
      redirect_to "/users/new"
    else
      render plain: "An error occured!"
    end
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def user_update_params
      params.require(:user).permit(:name, :email)
    end
end
