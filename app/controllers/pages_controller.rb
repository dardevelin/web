class PagesController < ApplicationController

  respond_to :js, :html

  def show
    expires_in 3.hours, 'max-stale' => 5.hours, :public => true
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
