class SitemapsController < ApplicationController

  def show
    headers["Content-Type"] = 'text/xml'
    expires_in 3.hours, 'max-stale' => 5.hours, :public => true
  end

end
