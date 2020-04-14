class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  # skip_before_action :authenticate_driver!, only: :home

  def home; end
end
def page_params
  params.require(:page).permit(:title, :body, :photo)
end
