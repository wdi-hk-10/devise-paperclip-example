class WelcomeController < ApplicationController
  before_action :authenticate_current_user, only: [:loggedin]
  def index

  end

  def loggedin

  end
end
