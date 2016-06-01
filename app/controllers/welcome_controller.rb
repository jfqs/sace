class WelcomeController < ApplicationController
  def index
    authorize :dashboard
  end
end
