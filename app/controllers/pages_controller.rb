class PagesController < ApplicationController

  respond_to :js, :html

  def show
    expires_in 5.minutes, 'max-stale' => 5.hours, :public => true if Rails.env.production?
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
