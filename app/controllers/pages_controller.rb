class PagesController < ApplicationController

  def home; end
end
def page_params
  params.require(:page).permit(:title, :body, :photo)
end
