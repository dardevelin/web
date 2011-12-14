class PagesController < ApplicationController

  respond_to :js, :html

  def show
    respond_to do |format|
      format.html{
        render template: "pages/#{params[:id]}"
      }
      format.js {
        render template: "pages/#{params[:id]}"
      }
    end
  end
end
