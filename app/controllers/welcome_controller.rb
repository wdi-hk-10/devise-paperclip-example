class WelcomeController < ApplicationController
  before_action :authenticate_current_user, only: [:loggedin, :image]
  def index
  end

  def loggedin
  end

  def image
    current_user.assign_attributes(image_param)
    if current_user.save
      render json: current_user
    else
      render json: current_user.errors.messages
    end
  end

private
  def image_param
    params.require(:user).permit(:image)
  end
end
