class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]
  skip_before_action :authenticate_driver!, only: [:home, :index]

  def home; end

  def index; end
end

def page_params
  params.require(:page).permit(:title, :body, :photo)
end
