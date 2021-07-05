class LikesController < ApplicationController
  def create
    like = Like.new(user: User.find(session[:user_id]), secret: Secret.find(params[:id]))
    if like.save
      redirect_to "/secrets"
    else
      render plain: "An error occured!"
    end
  end

  def destroy
    like = Secret.find(params[:id]).likes.where(user: User.find(session[:user_id]))
    if like[0].destroy
      redirect_to "/secrets"
    else
      render plain: "An error occured!"
    end
  end
end
