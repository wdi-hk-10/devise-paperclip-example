class WelcomeController < ApplicationController
  before_action :authenticate_current_user, only: [:loggedin, :save_image]
  def index
  end

  def loggedin
  end

  def save_image
    puts image_params
    current_user.assign_attributes(image_params)
    if current_user.save
      render json: current_user, status: :created
    else
      render json: current_user.errors.messages, status: :unprocessable_entity
    end
  end

private
  def image_params
    params.require(:user).permit(:image)
  end
end
