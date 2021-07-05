class SecretsController < ApplicationController
  def index
    @secrets = Secret.left_joins(:likes).select("secrets.*", "COUNT(likes.*) AS num_of_likes").group("secrets.id").order("secrets.id ASC")
  end

  def create
    secret = Secret.new(content: params[:content], user: User.find(params[:id]))
    if !secret.save
      flash[:errors] = secret.errors.messages
    end
    redirect_to "/users/#{params[:id]}"
  end

  def delete
    secret = Secret.find(params[:id])
    if secret.destroy
      redirect_to "/users/#{session[:user_id]}"
    else
      render plain: "An error occured!"
    end
  end
end
