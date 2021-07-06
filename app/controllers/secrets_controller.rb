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
    if session[:user_id] == secret[:user_id]
      if !secret.destroy
        flash[:error] = "An error occured!"
      end
    else
      flash[:error] = "An error occured!"
    end
    redirect_to "/users/#{session[:user_id]}"
  end
end
